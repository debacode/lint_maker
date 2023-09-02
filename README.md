Custom linting maker. Creates analysis_options.yaml files to your liking.
This package is useful if you want to either create your own linting package or just add a custom analysis_options.yaml file to your project.

## Setup:
Add lint_maker to your dev dependencies and create a `lint_maker.yaml` file in the root of your project.
The config can look something like:
```yaml
name: # name of the config
  commitHash: 7f40f11 # commitHash of the https://github.com/dart-lang/linter package to use as a base
  output: "analysis_options.yaml" # output file
  disabledRules: # disable rules
    - always_specify_types
    - avoid_annotating_with_dynamic
    - avoid_as
    - avoid_catches_without_on_clauses
    - avoid_catching_errors
    - avoid_classes_with_only_static_members
    - avoid_final_parameters
    - avoid_print
    - diagnostic_describe_all_properties
    - lines_longer_than_80_chars
    - no_default_cases
    - one_member_abstracts
    - prefer_double_quotes
    - prefer_relative_imports
    - unnecessary_final
  preset: # base config. Omit the `rules` section as it will be overwritten by the generated rules 
    analyzer:
      language:
        strict-casts: true
      errors:
        flutter_style_todos: ignore
        todo: ignore
      exclude:
        - "**.g.dart"
        - "**.mocks.dart"
```

You can specify multiple such configs in the same file.

### Update rules:
To update the rules you need to update the execute [lint_maker.dart](bin/lint_maker.dart) by running:
```sh
dart pub run lint_maker
```

