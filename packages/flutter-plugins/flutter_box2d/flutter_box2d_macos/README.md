# flutter_box2d_macos

## ffigen

> Currently (Apr '22), being on an M1 Mac, I have to jump on the master branch of flutter to get ARM64 Dart

```sh
dart run ffigen
```

### ffigen setup

- Add ffigen under dev_dependencies in your pubspec.yaml (run dart pub add -d ffigen).
- Install LLVM (see Installing LLVM).
- Configurations must be provided in pubspec.yaml or in a custom YAML file (see configurations).
- Run the tool with `dart run ffigen`.
