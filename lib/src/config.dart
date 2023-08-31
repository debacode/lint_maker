import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:lint_maker/src/analysis_options.dart';
import 'package:meta/meta.dart';

part 'config.g.dart';

@JsonSerializable(
  anyMap: true,
  checked: true,
  disallowUnrecognizedKeys: true,
  explicitToJson: true,
)
@CopyWith()
@immutable
class ConfigCollection {
  const ConfigCollection({
    required this.configurations,
  });

  factory ConfigCollection.fromJson(Map json) =>
      _$ConfigCollectionFromJson(json);
  Map<String, dynamic> toJson() => _$ConfigCollectionToJson(this);

  /// List configurations.
  @JsonKey(required: true)
  final Map<String, Configuration> configurations;
}

/// Configuration used for the builder.
@JsonSerializable(
  anyMap: true,
  checked: true,
  disallowUnrecognizedKeys: true,
  explicitToJson: true,
)
@CopyWith()
@immutable
class Configuration {
  /// Creates a new configuration.
  const Configuration({
    required this.commitHash,
    this.output = 'analysis_options.yaml',
    this.disabledRules = const [],
    this.excludedRules = const [],
    this.preset = const AnalysisOptions(),
  });

  /// Creates a new configuratin from a [json] map.
  factory Configuration.fromJson(Map json) => _$ConfigurationFromJson(json);

  /// Parses this configuration into json
  Map<String, dynamic> toJson() => _$ConfigurationToJson(this);

  /// Path of the output file.
  ///
  /// Defaults to `analysis_options.yaml`.
  final String output;

  /// The base commit form the linting repo.
  @JsonKey(required: true)
  final String commitHash;

  /// Linting rules to disable.
  final List<String> disabledRules;

  /// Linting rules to exclude from the list.
  ///
  /// This can be useful when you work with an older dart version not supporting the newer rules yet.
  final List<String> excludedRules;

  /// Preset options.
  final AnalysisOptions preset;

  @override
  String toString() => 'Configuration: ${toJson()}';
}
