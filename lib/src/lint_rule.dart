// Depends on upstream documentation.
// ignore_for_file: public_member_api_docs

import 'package:json_annotation/json_annotation.dart';

part 'lint_rule.g.dart';

@JsonSerializable()

/// The lint rule representation as used by the dart team in:
/// https://github.com/dart-lang/sdk/blob/main/pkg/linter/tool/machine/rules.json
class LintRule {
  const LintRule({
    required this.name,
    required this.description,
    required this.categories,
    required this.state,
    required this.incompatible,
    required this.sets,
    required this.fixStatus,
    required this.details,
    required this.sinceDartSdk,
  });

  /// Creates a new lint rule from a [json] map.
  factory LintRule.fromJson(Map<String, dynamic> json) =>
      _$LintRuleFromJson(json);

  /// Parses this lint rule into json
  Map<String, dynamic> toJson() => _$LintRuleToJson(this);

  final String name;
  final String description;
  final List<String> categories;
  final String state;
  final List<String> incompatible;
  final List<String> sets;
  final String fixStatus;
  final String details;
  final String sinceDartSdk;

  @override
  String toString() => 'LintRule: ${toJson()}';
}
