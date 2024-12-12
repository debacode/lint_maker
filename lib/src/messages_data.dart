import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:lint_maker/src/lint_rule.dart';
import 'package:version/version.dart';

final Uri _messageDataUrl = Uri.parse(
  'https://raw.githubusercontent.com/dart-lang/sdk/main/pkg/linter/tool/machine/rules.json',
);

/// Loads the lint `messages.yaml` from GitHub.
Future<MessagesData> loadMessagesYaml() async {
  final lintsResult = await http.get(_messageDataUrl);

  Object? rules;
  try {
    rules = json.decode(lintsResult.body);
  } catch (e) {
    throw StateError('can not decode rules.json');
  }

  if (rules is! List) {
    throw StateError('can not parse rules.json');
  }

  final parsed = rules.map((e) {
    if (e is! Map<String, dynamic>) {
      throw StateError('can not parse rules.json');
    }

    return LintRule.fromJson(e);
  }).toList();

  return MessagesData(parsed);
}

/// Message data for all lints.
extension type MessagesData(List<LintRule> _lintCodes) {
  /// A collection of names of the lint rules compatible with the [dartVersion].
  ///
  /// Only the shared name of a lint code is returned.
  Set<String> supportedLintCodes(Version dartVersion) {
    final result = <String>{};

    for (final code in _lintCodes) {
      final addedIn = Version.parse(code.sinceDartSdk);

      if (dartVersion < addedIn || code.state != 'stable') {
        continue;
      }

      result.add(code.name);
    }

    return result;
  }
}
