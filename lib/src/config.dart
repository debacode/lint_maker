// ignore_for_file: document_ignores

// ignore: implementation_imports
import 'package:analyzer/src/util/file_paths.dart' as file_paths;
import 'package:json_annotation/json_annotation.dart';

part 'config.g.dart';

/// Configuration used for the builder.
@JsonSerializable(
  anyMap: true,
  checked: true,
  disallowUnrecognizedKeys: true,
  explicitToJson: true,
)
class Configuration {
  /// Creates a new configuration.
  const Configuration({
    required this.preset,
    this.output = file_paths.analysisOptionsYaml,
  });

  /// Creates a new configuration from a [json] map.
  factory Configuration.fromJson(Map<dynamic, dynamic> json) =>
      _$ConfigurationFromJson(json);

  /// Parses this configuration into json
  Map<String, dynamic> toJson() => _$ConfigurationToJson(this);

  /// Path of the output file.
  ///
  /// Defaults to `analysis_options.yaml`.
  final String output;

  /// Preset options.
  final Map<String, Object> preset;

  @override
  String toString() => 'Configuration: ${toJson()}';
}
