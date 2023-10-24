import 'dart:convert';
import 'dart:io';

// ignore: implementation_imports
import 'package:analyzer/src/analysis_options/analysis_options_provider.dart';
import 'package:checked_yaml/checked_yaml.dart';
import 'package:http/http.dart' as http;
import 'package:json2yaml/json2yaml.dart';
import 'package:lint_maker/src/config.dart';
import 'package:version/version.dart';
import 'package:yaml/yaml.dart';

const String _configPath = 'lint_maker.yaml';

const String _allLintsUrl =
    'https://raw.githubusercontent.com/dart-lang/sdk/main/pkg/linter/example/all.yaml';
const String _lintsVersionUrl =
    'https://raw.githubusercontent.com/dart-lang/sdk/main/pkg/linter/tool/since/sdk.yaml';

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

  final lintsUri = Uri.parse(_allLintsUrl);
  final versionsUri = Uri.parse(_lintsVersionUrl);

  final lintsResult = await http.get(lintsUri);
  final defaults = _loadYamlMap(lintsResult.body);
  final versionsResult = await http.get(versionsUri);
  final versions = checkedYamlDecode(
    versionsResult.body,
    (m) => m!.entries.map(
      (entry) => (
        entry.key as String,
        Version.parse(entry.value as String),
      ),
    ),
  );

  final dartVersion = Version.parse(Platform.version.split(' ').first);
  final unsupportedRules = versions
      .where((element) => element.$2 > dartVersion)
      .map((element) => element.$1);

  for (final config in configCollection.values) {
    final overrides = config.preset;
    final allRules = (defaults['linter'] as YamlMap)['rules'] as YamlNode;
    final disabledRules = (overrides['linter']! as Map)['rules'] as YamlNode;

    final rules = <String, Object>{}
      ..addEntries(_yamlNodeEntries(allRules, true))
      ..addEntries(_yamlNodeEntries(disabledRules, false))
      ..removeWhere((key, value) => unsupportedRules.contains(key));

    final output = json.decode(json.encode(overrides)) as Map<String, dynamic>;
    (output['linter'] as Map)['rules'] = rules;

    File(config.output).writeAsStringSync(json2yaml(output));
  }
}

Iterable<MapEntry<String, Object>> _yamlNodeEntries(
  YamlNode rules,
  Object value,
) sync* {
  final ruleList = switch (rules) {
    YamlList() => rules.nodes,
    YamlMap() => rules.nodes.cast<YamlNode, YamlNode>().keys,
    _ => throw ArgumentError(
        'Can not wor with the node type ${rules.runtimeType}',
      ),
  };

  for (final element in ruleList) {
    yield MapEntry(element.value.toString(), value);
  }
}

YamlMap _loadYamlMap(String content) {
  try {
    final doc = loadYamlNode(content);
    return doc is YamlMap ? doc : YamlMap();
  } on YamlException catch (e) {
    throw OptionsFormatException(e.message, e.span);
  } catch (e) {
    throw OptionsFormatException('Unable to parse YAML document.');
  }
}
