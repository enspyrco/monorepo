# redfire_lints

This package contains a recommended set of lints for [RedFire] apps.

The redfire lints are a selected set added to the set of lints from [flutter_lints], along with:

- [stricter type checks] enabled
- [custom analysis rules] added to ignore generated files

**Background info from [flutter_lints]:**

Lints are surfaced by the [dart analyzer], which statically checks dart code.
[Dart-enabled IDEs] typically present the issues identified by the analyzer in
their UI. Alternatively, the analyzer can be invoked manually by running
`flutter analyze`.

## Usage

### pubspec

In `pubspec.yaml` replace

```yaml
flutter_lints: ^1.0.0 
```

with

```yaml
redfire_lints: ^1.0.0 
```

### analysis_options

Replace the contents of `analysis_options.yaml` file with:

```yaml
include: package:redfire_lints/flutter.yaml
```

[flutter_lints]: https://github.com/flutter/packages/tree/master/packages/flutter_lints
[RedFire]: https://github.com/enspyrco/monorepo/tree/main/packages/redfire/
[stricter type checks]: https://dart.dev/guides/language/analysis-options#enabling-additional-type-checks
[custom analysis rules]: https://dart.dev/guides/language/analysis-options#customizing-analysis-rules
[dart analyzer]: https://dart.dev/guides/language/analysis-options
[Dart-enabled IDEs]: https://dart.dev/tools#ides-and-editors
[package:lints]: https://pub.dev/packages/lints
