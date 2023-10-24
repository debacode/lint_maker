# Dart lint maker
Custom linting maker. Creates analysis_options.yaml files to your liking.
This package is useful if you want to either create your own linting package or just add a custom analysis_options.yaml file to your project.

## Setup:
Add lint_maker to your dev dependencies and create a `lint_maker.yaml` file in the root of your project.
The config can look something like:
```yaml
name: # internal name of the config
  output: "analysis_options.yaml" # output file
  preset: # The base analyzer config
    analyzer:
      language:
        strict-casts: true
        strict-inference: true
        strict-raw-types: true
      exclude:
        - "**.g.dart"
    linter:
      rules: # All rules specified here wether true or false will be disabled
        always_specify_types: false
        avoid_annotating_with_dynamic: false
        avoid_as: false
        avoid_print: false
        diagnostic_describe_all_properties: false
        prefer_double_quotes: false
        prefer_relative_imports: false
        unnecessary_final: false
        prefer_final_parameters: false
        prefer_expression_function_bodies: false
        avoid_catches_without_on_clauses: false
```

You can specify multiple such configs in the same file.

### Update rules:
To update the rules you need to update the execute [lint_maker.dart](bin/lint_maker.dart) by running:
```sh
dart pub run lint_maker
```

