import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'analysis_options.g.dart';

/// File format used by the `analysis_options.yaml`
@JsonSerializable(
  anyMap: true,
  checked: true,
  disallowUnrecognizedKeys: true,
  explicitToJson: true,
)
@CopyWith()
@immutable
class AnalysisOptions {
  /// creates a new analisis options configuration.
  const AnalysisOptions({
    this.analyzer,
    this.linter,
  });

  /// Creates a new analisis options configuration from a [json] map.
  factory AnalysisOptions.fromJson(Map json) => _$AnalysisOptionsFromJson(json);

  /// Parses this analisis options configuration into json
  Map<String, dynamic> toJson() => _$AnalysisOptionsToJson(this);

  /// Analyzer settings.
  final AnalyzerOptions? analyzer;

  /// Linter settings
  final LinterOptions? linter;

  @override
  String toString() => 'AnalysisOptions: ${toJson()}';
}

/// Analyzer settings in the [AnalysisOptions].
@JsonSerializable(
  anyMap: true,
  checked: true,
  disallowUnrecognizedKeys: true,
  explicitToJson: true,
)
@CopyWith()
@immutable
class AnalyzerOptions {
  /// creates a new analyzer setting.
  const AnalyzerOptions({
    this.language,
    this.errors,
    this.exclude,
  });

  /// Creates a new analyzer setting from a [json] map.
  factory AnalyzerOptions.fromJson(Map json) => _$AnalyzerOptionsFromJson(json);

  /// Parses this analyzer setting configuration into json
  Map<String, dynamic> toJson() => _$AnalyzerOptionsToJson(this);

  /// Dart language options.
  final Map<String, bool>? language;

  /// Error options.
  final Map<String, String>? errors;

  /// List of excluded files/directories.
  final List<String>? exclude;

  @override
  String toString() => 'AnalyzerOptions: ${toJson()}';
}

/// Linter settings in the [AnalysisOptions].
@JsonSerializable(
  anyMap: true,
  checked: true,
  disallowUnrecognizedKeys: true,
  explicitToJson: true,
)
@CopyWith()
@immutable
class LinterOptions {
  /// creates a new linter setting.
  const LinterOptions({
    this.rules,
  });

  /// Creates a new linter setting from a [json] map.
  factory LinterOptions.fromJson(Map json) => _$LinterOptionsFromJson(json);

  /// Parses this linter setting configuration into json
  Map<String, dynamic> toJson() => _$LinterOptionsToJson(this);

  /// Rules
  ///
  /// Rules can either be a [List<String>] containing the rules only or
  /// a [Map<String, bool>] containing a mapping of a rule and whether it is
  /// enabled.
  final Object? rules;

  @override
  String toString() => 'LinterOptions: ${toJson()}';
}
