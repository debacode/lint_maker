import 'dart:convert';
import 'dart:io';

import 'package:checked_yaml/checked_yaml.dart';
import 'package:json2yaml/json2yaml.dart';
import 'package:lint_maker/src/config.dart';
import 'package:lint_maker/src/messages_data.dart';
import 'package:version/version.dart';
import 'package:yaml/yaml.dart';

const String _configPath = 'lint_maker.yaml';

/// Runs the lint maker utility.
Future<void> runLintMaker() async {
  final file = File(_configPath);

  final configCollection = <String, Configuration>{};

  if (!FileSystemEntity.isFileSync(_configPath)) {
    throw const PathNotFoundException(
      _configPath,
      OSError(),
      'No config found at $_configPath',
    );
  } else {
    final yamlContent = file.readAsStringSync();

    try {
      configCollection.addAll(
        checkedYamlDecode(
          yamlContent,
          (m) => m!.map(
            (name, value) => MapEntry(
              name as String,
              Configuration.fromJson(value! as Map),
            ),
          ),
          sourceUrl: file.uri,
        ),
      );
    } on ParsedYamlException catch (e) {
      print('An error occurred: $e');
      return;
    }
  }

  final messagesYaml = await loadMessagesYaml();
  final dartVersion = Version.parse(Platform.version.split(' ').first);

  for (final config in configCollection.values) {
    final overrides = config.preset;
    final disabledRules = (overrides['linter']! as Map)['rules'];

    final rules = <String, Object?>{};
    for (final lintCode in messagesYaml.supportedLintCodes(dartVersion)) {
      rules[lintCode] = true;
    }

    switch (disabledRules) {
      case YamlList(:final nodes):
        for (final element in nodes) {
          rules[element.value.toString()] = false;
        }
      case YamlMap(:final nodes):
        for (final MapEntry(key: YamlNode name, value: YamlNode data)
            in nodes.entries) {
          rules[name.value.toString()] = data.value;
        }
      default:
        throw ArgumentError(
          'Can not work with the node type ${rules.runtimeType}',
        );
    }

    final output = json.decode(json.encode(overrides)) as Map<String, dynamic>;
    (output['linter'] as Map)['rules'] = rules;

    File(config.output).writeAsStringSync(json2yaml(output));
  }
}
