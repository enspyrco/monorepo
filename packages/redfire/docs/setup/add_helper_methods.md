# How to add helper methods

[< README](../../README.md)

## dispatch

Add an extension on `BuildContext` so we can call `context.dispatch()` without needing to add `<AppState>`.

`lib/utils/build_context_extension.dart`

```Dart
import 'package:flutter/widgets.dart';
import 'package:redfire/types.dart';
import 'package:redfire/utils.dart';
import 'package:.../app_state.dart';

extension BuildContextExtension on BuildContext {
  dynamic dispatch(ReduxAction action) => dispatchWith<AppState>(action, this);
}
```
