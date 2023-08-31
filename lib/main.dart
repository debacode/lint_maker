import 'dart:io';

import 'package:checked_yaml/checked_yaml.dart';
import 'package:http/http.dart' as http;
import 'package:json2yaml/json2yaml.dart';
import 'package:lint_maker/src/analysis_options.dart';
import 'package:lint_maker/src/config.dart';

const configPath = 'lint_maker.yaml';

Future main(List<String> arguments) async {
  final file = File(configPath);

  if (!FileSystemEntity.isFileSync(configPath)) {
    throw const PathNotFoundException(
      configPath,
      OSError(),
      'No configuration found at $configPath',
    );
  }

  final yamlContent = file.readAsStringSync();

  final Map<String, Configuration> configCollection;
  try {
    configCollection = checkedYamlDecode(
      yamlContent,
      (m) {
        return m!.map(
          (name, value) => MapEntry(
            name as String,
            Configuration.fromJson(value! as Map),
          ),
        );
      },
      sourceUrl: file.uri,
    );
  } on ParsedYamlException catch (e) {
    print('An error occured: $e');
    return;
  }

  for (final config in configCollection.values) {
    final lintsUri = Uri.parse(
      'https://raw.githubusercontent.com/dart-lang/linter/${config.commitHash}/example/all.yaml',
    );

    final result = await http.get(lintsUri);
    final options = checkedYamlDecode(
      result.body,
      (m) => AnalysisOptions.fromJson(m!),
      sourceUrl: lintsUri,
    );

    final List<Map<String, bool>> rules = [];

    if (options.linter?.rules != null) {
      for (final line in options.linter!.rules!) {
        final excluded = config.excludedRules.contains(line);
        if (!excluded) {
          final disabled = config.disabledRules.contains(line);
          rules.add({line as String: !disabled});
        }
      }
    }

    final linter = LinterOptions(rules: rules);
    final analyzerOptions = config.preset.copyWith(linter: linter);

    File(config.output).writeAsStringSync(json2yaml(analyzerOptions.toJson()));
  }
}
