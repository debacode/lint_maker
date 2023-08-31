// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'analysis_options.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$AnalysisOptionsCWProxy {
  AnalysisOptions analyzer(AnalyzerOptions? analyzer);

  AnalysisOptions linter(LinterOptions? linter);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AnalysisOptions(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AnalysisOptions(...).copyWith(id: 12, name: "My name")
  /// ````
  AnalysisOptions call({
    AnalyzerOptions? analyzer,
    LinterOptions? linter,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfAnalysisOptions.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfAnalysisOptions.copyWith.fieldName(...)`
class _$AnalysisOptionsCWProxyImpl implements _$AnalysisOptionsCWProxy {
  const _$AnalysisOptionsCWProxyImpl(this._value);

  final AnalysisOptions _value;

  @override
  AnalysisOptions analyzer(AnalyzerOptions? analyzer) =>
      this(analyzer: analyzer);

  @override
  AnalysisOptions linter(LinterOptions? linter) => this(linter: linter);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AnalysisOptions(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AnalysisOptions(...).copyWith(id: 12, name: "My name")
  /// ````
  AnalysisOptions call({
    Object? analyzer = const $CopyWithPlaceholder(),
    Object? linter = const $CopyWithPlaceholder(),
  }) {
    return AnalysisOptions(
      analyzer: analyzer == const $CopyWithPlaceholder()
          ? _value.analyzer
          // ignore: cast_nullable_to_non_nullable
          : analyzer as AnalyzerOptions?,
      linter: linter == const $CopyWithPlaceholder()
          ? _value.linter
          // ignore: cast_nullable_to_non_nullable
          : linter as LinterOptions?,
    );
  }
}

extension $AnalysisOptionsCopyWith on AnalysisOptions {
  /// Returns a callable class that can be used as follows: `instanceOfAnalysisOptions.copyWith(...)` or like so:`instanceOfAnalysisOptions.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$AnalysisOptionsCWProxy get copyWith => _$AnalysisOptionsCWProxyImpl(this);
}

abstract class _$AnalyzerOptionsCWProxy {
  AnalyzerOptions language(Map<String, bool>? language);

  AnalyzerOptions errors(Map<String, String>? errors);

  AnalyzerOptions exclude(List<String>? exclude);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AnalyzerOptions(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AnalyzerOptions(...).copyWith(id: 12, name: "My name")
  /// ````
  AnalyzerOptions call({
    Map<String, bool>? language,
    Map<String, String>? errors,
    List<String>? exclude,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfAnalyzerOptions.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfAnalyzerOptions.copyWith.fieldName(...)`
class _$AnalyzerOptionsCWProxyImpl implements _$AnalyzerOptionsCWProxy {
  const _$AnalyzerOptionsCWProxyImpl(this._value);

  final AnalyzerOptions _value;

  @override
  AnalyzerOptions language(Map<String, bool>? language) =>
      this(language: language);

  @override
  AnalyzerOptions errors(Map<String, String>? errors) => this(errors: errors);

  @override
  AnalyzerOptions exclude(List<String>? exclude) => this(exclude: exclude);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AnalyzerOptions(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AnalyzerOptions(...).copyWith(id: 12, name: "My name")
  /// ````
  AnalyzerOptions call({
    Object? language = const $CopyWithPlaceholder(),
    Object? errors = const $CopyWithPlaceholder(),
    Object? exclude = const $CopyWithPlaceholder(),
  }) {
    return AnalyzerOptions(
      language: language == const $CopyWithPlaceholder()
          ? _value.language
          // ignore: cast_nullable_to_non_nullable
          : language as Map<String, bool>?,
      errors: errors == const $CopyWithPlaceholder()
          ? _value.errors
          // ignore: cast_nullable_to_non_nullable
          : errors as Map<String, String>?,
      exclude: exclude == const $CopyWithPlaceholder()
          ? _value.exclude
          // ignore: cast_nullable_to_non_nullable
          : exclude as List<String>?,
    );
  }
}

extension $AnalyzerOptionsCopyWith on AnalyzerOptions {
  /// Returns a callable class that can be used as follows: `instanceOfAnalyzerOptions.copyWith(...)` or like so:`instanceOfAnalyzerOptions.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$AnalyzerOptionsCWProxy get copyWith => _$AnalyzerOptionsCWProxyImpl(this);
}

abstract class _$LinterOptionsCWProxy {
  LinterOptions rules(List<Object>? rules);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `LinterOptions(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// LinterOptions(...).copyWith(id: 12, name: "My name")
  /// ````
  LinterOptions call({
    List<Object>? rules,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfLinterOptions.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfLinterOptions.copyWith.fieldName(...)`
class _$LinterOptionsCWProxyImpl implements _$LinterOptionsCWProxy {
  const _$LinterOptionsCWProxyImpl(this._value);

  final LinterOptions _value;

  @override
  LinterOptions rules(List<Object>? rules) => this(rules: rules);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `LinterOptions(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// LinterOptions(...).copyWith(id: 12, name: "My name")
  /// ````
  LinterOptions call({
    Object? rules = const $CopyWithPlaceholder(),
  }) {
    return LinterOptions(
      rules: rules == const $CopyWithPlaceholder()
          ? _value.rules
          // ignore: cast_nullable_to_non_nullable
          : rules as List<Object>?,
    );
  }
}

extension $LinterOptionsCopyWith on LinterOptions {
  /// Returns a callable class that can be used as follows: `instanceOfLinterOptions.copyWith(...)` or like so:`instanceOfLinterOptions.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$LinterOptionsCWProxy get copyWith => _$LinterOptionsCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AnalysisOptions _$AnalysisOptionsFromJson(Map json) => $checkedCreate(
      'AnalysisOptions',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          allowedKeys: const ['analyzer', 'linter'],
        );
        final val = AnalysisOptions(
          analyzer: $checkedConvert('analyzer',
              (v) => v == null ? null : AnalyzerOptions.fromJson(v as Map)),
          linter: $checkedConvert('linter',
              (v) => v == null ? null : LinterOptions.fromJson(v as Map)),
        );
        return val;
      },
    );

Map<String, dynamic> _$AnalysisOptionsToJson(AnalysisOptions instance) =>
    <String, dynamic>{
      'analyzer': instance.analyzer?.toJson(),
      'linter': instance.linter?.toJson(),
    };

AnalyzerOptions _$AnalyzerOptionsFromJson(Map json) => $checkedCreate(
      'AnalyzerOptions',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          allowedKeys: const ['language', 'errors', 'exclude'],
        );
        final val = AnalyzerOptions(
          language: $checkedConvert(
              'language',
              (v) => (v as Map?)?.map(
                    (k, e) => MapEntry(k as String, e as bool),
                  )),
          errors: $checkedConvert(
              'errors',
              (v) => (v as Map?)?.map(
                    (k, e) => MapEntry(k as String, e as String),
                  )),
          exclude: $checkedConvert('exclude',
              (v) => (v as List<dynamic>?)?.map((e) => e as String).toList()),
        );
        return val;
      },
    );

Map<String, dynamic> _$AnalyzerOptionsToJson(AnalyzerOptions instance) =>
    <String, dynamic>{
      'language': instance.language,
      'errors': instance.errors,
      'exclude': instance.exclude,
    };

LinterOptions _$LinterOptionsFromJson(Map json) => $checkedCreate(
      'LinterOptions',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          allowedKeys: const ['rules'],
        );
        final val = LinterOptions(
          rules: $checkedConvert('rules',
              (v) => (v as List<dynamic>?)?.map((e) => e as Object).toList()),
        );
        return val;
      },
    );

Map<String, dynamic> _$LinterOptionsToJson(LinterOptions instance) =>
    <String, dynamic>{
      'rules': instance.rules,
    };
