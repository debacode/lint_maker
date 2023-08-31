import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'analysis_options.g.dart';

@JsonSerializable(
  anyMap: true,
  checked: true,
  disallowUnrecognizedKeys: true,
  explicitToJson: true,
)
@CopyWith()
@immutable
class AnalysisOptions {
  const AnalysisOptions({
    this.analyzer,
    this.linter,
  });

  factory AnalysisOptions.fromJson(Map json) => _$AnalysisOptionsFromJson(json);
  Map<String, dynamic> toJson() => _$AnalysisOptionsToJson(this);

  final AnalyzerOptions? analyzer;
  final LinterOptions? linter;

  @override
  String toString() => 'AnalysisOptions: ${toJson()}';
}

@JsonSerializable(
  anyMap: true,
  checked: true,
  disallowUnrecognizedKeys: true,
  explicitToJson: true,
)
@CopyWith()
@immutable
class AnalyzerOptions {
  const AnalyzerOptions({
    this.language,
    this.errors,
    this.exclude,
  });

  factory AnalyzerOptions.fromJson(Map json) => _$AnalyzerOptionsFromJson(json);
  Map<String, dynamic> toJson() => _$AnalyzerOptionsToJson(this);

  final Map<String, bool>? language;
  final Map<String, String>? errors;
  final List<String>? exclude;

  @override
  String toString() => 'AnalyzerOptions: ${toJson()}';
}

@JsonSerializable(
  anyMap: true,
  checked: true,
  disallowUnrecognizedKeys: true,
  explicitToJson: true,
)
@CopyWith()
@immutable
class LinterOptions {
  const LinterOptions({
    this.rules,
  });

  factory LinterOptions.fromJson(Map json) => _$LinterOptionsFromJson(json);
  Map<String, dynamic> toJson() => _$LinterOptionsToJson(this);

  final Object? rules;

  @override
  String toString() => 'LinterOptions: ${toJson()}';
}
