import 'package:http/http.dart' as http;
import 'package:version/version.dart';
import 'package:yaml/yaml.dart';

final Uri _messageDataUrl = Uri.parse(
  'https://raw.githubusercontent.com/dart-lang/sdk/main/pkg/linter/messages.yaml',
);

/// Loads the lint `messages.yaml` from GitHub.
Future<MessagesData> loadMessagesYaml() async {
  final lintsResult = await http.get(_messageDataUrl);

  final doc = loadYamlNode(
    lintsResult.body,
    sourceUrl: _messageDataUrl,
  );
  if (doc is! YamlMap) {
    throw StateError('messages.yaml is not a map');
  }
  return MessagesData(doc);
}

/// Message data for all lints.
extension type MessagesData(YamlMap _map) {
  /// A map containing all lint codes and their data.
  YamlMap get lintCodes {
    final lintRuleSection = _map['LintCode'] as YamlMap?;
    if (lintRuleSection == null) {
      throw StateError(
        "Error: 'messages.yaml' does not have a 'LintCode' section.",
      );
    }
    return lintRuleSection;
  }

  /// A collection of names of the lint rules compatible with the [dartVersion].
  ///
  /// Only the shared name of a lint code is returned.
  Set<String> supportedLintCodes(Version dartVersion) {
    final result = <String>{};

    for (var MapEntry(key: String name, value: YamlMap data)
        in lintCodes.entries) {
      if (data.containsKey('sharedName')) {
        name = data['sharedName'] as String;
      }

      Version? addedIn;
      if (data['addedIn'] case final String addedInString) {
        addedIn = Version.parse(addedInString);
      }

      Version? removedIn;
      if (data['removedIn'] case final String removedInString) {
        removedIn = Version.parse(removedInString);
      }

      if (dartVersion < addedIn || dartVersion >= removedIn) {
        continue;
      }

      result.add(name);
    }

    return result;
  }
}
