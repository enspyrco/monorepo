# redfire setup 

[< README](../README.md)

### Add to pubspec.yaml...

We need the `redfire` package and... 

#### required 
- `fast_immutable_collections` because we need an AppState that ‘extends’ RedFireState which uses an IList (could we use Iterable instead?) 
- `freezed` & `json_serializable` because that’s how we implement AppState 

#### optional 

- `flutter_redux` if you want to add your own StoreConnector widgets 
- `redux` if you want to add your own Middleware/Reducers 
EDIT: some of these are optional 

```yml
dependencies:
...
  redfire:
    git: https://github.com/enspyrco/redfire.git
  freezed_annotation:
  json_annotation:
  redux:
  flutter_redux:
  fast_immutable_collections:
 
dev_dependencies:
... 
  build_runner:
  freezed:
  json_serializable:
```

### Add app_state.dart

```Dart
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:redfire/types.dart';
 
part 'app_state.freezed.dart';
part 'app_state.g.dart';
 
@freezed
class AppState with _$AppState, RedFireState {
  factory AppState({
    /// RedFire
    required AuthState auth,
    required IList<PageData> pages,
    required IList<ProblemInfo> problems,
    required Settings settings,
    ProfileData? profile,

    /// Your additional AppState members
  }) = _AppState;
 
 factory AppState.init() => AppState(
    auth: AuthState.init(),
    pages: <PageData>[const InitialPageData()].lock,
    problems: IList(),
    settings: Settings.init(),
    /// Your additional init code
  );
 
  factory AppState.fromJson(Map<String, Object?> json) =>
    _$AppStateFromJson(json);
}
```

### Update main.dart 

```Dart
import 'package:flutter/widgets.dart';
import 'package:.../main_page.dart';
import 'package:redfire/src/app-init/widgets/app_widget.dart';
 
import 'models/app_state.dart';
 
void main() => runApp(AppWidget<AppState>(
  initialState: AppState.init(),
  initialActions: [],
  middlewares: [],
  reducers: [],
  mainPage: MainPage(),
));
```