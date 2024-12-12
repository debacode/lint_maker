// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lint_rule.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LintRule _$LintRuleFromJson(Map<String, dynamic> json) => LintRule(
      name: json['name'] as String,
      description: json['description'] as String,
      categories: (json['categories'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      state: json['state'] as String,
      incompatible: (json['incompatible'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      sets: (json['sets'] as List<dynamic>).map((e) => e as String).toList(),
      fixStatus: json['fixStatus'] as String,
      details: json['details'] as String,
      sinceDartSdk: json['sinceDartSdk'] as String,
    );

Map<String, dynamic> _$LintRuleToJson(LintRule instance) => <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'categories': instance.categories,
      'state': instance.state,
      'incompatible': instance.incompatible,
      'sets': instance.sets,
      'fixStatus': instance.fixStatus,
      'details': instance.details,
      'sinceDartSdk': instance.sinceDartSdk,
    };
