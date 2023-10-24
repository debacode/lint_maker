// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Configuration _$ConfigurationFromJson(Map json) => $checkedCreate(
      'Configuration',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          allowedKeys: const ['output', 'preset'],
        );
        final val = Configuration(
          preset: $checkedConvert(
              'preset',
              (v) => (v as Map).map(
                    (k, e) => MapEntry(k as String, e as Object),
                  )),
          output: $checkedConvert(
              'output', (v) => v as String? ?? file_paths.analysisOptionsYaml),
        );
        return val;
      },
    );

Map<String, dynamic> _$ConfigurationToJson(Configuration instance) =>
    <String, dynamic>{
      'output': instance.output,
      'preset': instance.preset,
    };
