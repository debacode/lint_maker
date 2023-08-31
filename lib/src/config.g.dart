// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'config.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ConfigurationCWProxy {
  Configuration commitHash(String commitHash);

  Configuration output(String output);

  Configuration disabledRules(List<String> disabledRules);

  Configuration excludedRules(List<String> excludedRules);

  Configuration preset(AnalysisOptions preset);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Configuration(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Configuration(...).copyWith(id: 12, name: "My name")
  /// ````
  Configuration call({
    String? commitHash,
    String? output,
    List<String>? disabledRules,
    List<String>? excludedRules,
    AnalysisOptions? preset,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfConfiguration.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfConfiguration.copyWith.fieldName(...)`
class _$ConfigurationCWProxyImpl implements _$ConfigurationCWProxy {
  const _$ConfigurationCWProxyImpl(this._value);

  final Configuration _value;

  @override
  Configuration commitHash(String commitHash) => this(commitHash: commitHash);

  @override
  Configuration output(String output) => this(output: output);

  @override
  Configuration disabledRules(List<String> disabledRules) =>
      this(disabledRules: disabledRules);

  @override
  Configuration excludedRules(List<String> excludedRules) =>
      this(excludedRules: excludedRules);

  @override
  Configuration preset(AnalysisOptions preset) => this(preset: preset);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Configuration(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Configuration(...).copyWith(id: 12, name: "My name")
  /// ````
  Configuration call({
    Object? commitHash = const $CopyWithPlaceholder(),
    Object? output = const $CopyWithPlaceholder(),
    Object? disabledRules = const $CopyWithPlaceholder(),
    Object? excludedRules = const $CopyWithPlaceholder(),
    Object? preset = const $CopyWithPlaceholder(),
  }) {
    return Configuration(
      commitHash:
          commitHash == const $CopyWithPlaceholder() || commitHash == null
              ? _value.commitHash
              // ignore: cast_nullable_to_non_nullable
              : commitHash as String,
      output: output == const $CopyWithPlaceholder() || output == null
          ? _value.output
          // ignore: cast_nullable_to_non_nullable
          : output as String,
      disabledRules:
          disabledRules == const $CopyWithPlaceholder() || disabledRules == null
              ? _value.disabledRules
              // ignore: cast_nullable_to_non_nullable
              : disabledRules as List<String>,
      excludedRules:
          excludedRules == const $CopyWithPlaceholder() || excludedRules == null
              ? _value.excludedRules
              // ignore: cast_nullable_to_non_nullable
              : excludedRules as List<String>,
      preset: preset == const $CopyWithPlaceholder() || preset == null
          ? _value.preset
          // ignore: cast_nullable_to_non_nullable
          : preset as AnalysisOptions,
    );
  }
}

extension $ConfigurationCopyWith on Configuration {
  /// Returns a callable class that can be used as follows: `instanceOfConfiguration.copyWith(...)` or like so:`instanceOfConfiguration.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ConfigurationCWProxy get copyWith => _$ConfigurationCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Configuration _$ConfigurationFromJson(Map json) => $checkedCreate(
      'Configuration',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          allowedKeys: const [
            'output',
            'commitHash',
            'disabledRules',
            'excludedRules',
            'preset'
          ],
          requiredKeys: const ['commitHash'],
        );
        final val = Configuration(
          commitHash: $checkedConvert('commitHash', (v) => v as String),
          output: $checkedConvert(
              'output', (v) => v as String? ?? 'analysis_options.yaml'),
          disabledRules: $checkedConvert(
              'disabledRules',
              (v) =>
                  (v as List<dynamic>?)?.map((e) => e as String).toList() ??
                  const []),
          excludedRules: $checkedConvert(
              'excludedRules',
              (v) =>
                  (v as List<dynamic>?)?.map((e) => e as String).toList() ??
                  const []),
          preset: $checkedConvert(
              'preset',
              (v) => v == null
                  ? const AnalysisOptions()
                  : AnalysisOptions.fromJson(v as Map)),
        );
        return val;
      },
    );

Map<String, dynamic> _$ConfigurationToJson(Configuration instance) =>
    <String, dynamic>{
      'output': instance.output,
      'commitHash': instance.commitHash,
      'disabledRules': instance.disabledRules,
      'excludedRules': instance.excludedRules,
      'preset': instance.preset.toJson(),
    };
