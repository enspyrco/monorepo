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
import 'package:redfire/auth/enums/auth_step_enum.dart';
import 'package:redfire/auth/models/auth_user_data.dart';
import 'package:redfire/navigation/models/red_fire_page.dart';
import 'package:redfire/problems/models/problem_info.dart';
import 'package:redfire/settings/models/settings.dart';
import 'package:redfire/types/red_fire_state.dart';
 
part 'app_state.freezed.dart';
part 'app_state.g.dart';
 
@freezed
class AppState with _$AppState, RedFireState {
 factory AppState({
   required IList<RedFirePage> redFirePages,
   required IList<ProblemInfo> problems,
   required Settings settings,
   required AuthStepEnum authStep,
   required AuthUserData? authUserData,
 }) = _AppState;
 
 factory AppState.init() => AppState(
     redFirePages: <RedFirePage>[RedFireInitialPage()].lock,
     problems: IList(),
     settings: Settings.init(),
     authStep: AuthStepEnum.waitingForInput,
     authUserData: null);
 
 factory AppState.fromJson(Map<String, Object?> json) =>
     _$AppStateFromJson(json);
}
```

### Update main.dart 

```Dart
import 'package:flutter/widgets.dart';
import 'package:.../main_page.dart';
import 'package:redfire/app-init/widgets/app_widget.dart';
 
import 'models/app_state.dart';
 
void main() => runApp(AppWidget<AppState>(
     initialState: AppState.init(),
     initialActions: [],
     reducers: [],
     mainPage: MainPage(),
   ));
```