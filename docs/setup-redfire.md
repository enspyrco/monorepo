# Setup RedFire

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
  redfire_test:
    git: https://github.com/enspyrco/redfire_test.git
  build_runner:
  freezed:
  json_serializable:
```

### Update main.dart 

```Dart
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter/widgets.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:redfire/types.dart';
import 'package:redfire/widgets.dart';

part 'main.freezed.dart';
part 'main.g.dart';
 
void main() => runApp(AppWidget<AppState>(
  initialState: AppState.init(),
  initialActions: const [],
  middlewares: const [],
  reducers: const [],
  title: <Your App Title>, // optional, defaults to 'Title Note Set'
  mainPage: const MainPage(),
));

@freezed
class AppState with _$AppState, RedFireState {
  factory AppState({
    /// RedFire AppState members
    required AuthState auth,
    required IList<PageData> pages,
    required IList<ProblemInfo> problems,
    required Settings settings,
    ProfileData? profile,

    /// Additional AppState members
  }) = _AppState;
 
 factory AppState.init() => AppState(
    /// RedFire init code
    auth: AuthState.init(),
    pages: <PageData>[const InitialPageData()].lock,
    problems: IList(),
    settings: Settings.init(),
    
    /// Additional init code
  );
 
  factory AppState.fromJson(Map<String, Object?> json) =>
    _$AppStateFromJson(json);
}

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('MainPage'));
  }
}
```

Add to `.gitignore` (delete any commited generated files & commit first):

```sh
# Generated files
*.g.dart
*.freezed.dart
*.mocks.dart
```

Add to `analysis_options.yaml`:

```yaml
analyzer:
  exclude: 
    - build/**
    - lib/**/*.g.dart
    - lib/**/*.freezed.dart
    - test/**/*.mocks.dart
  strong-mode:
    implicit-casts: false
    implicit-dynamic: false
```

You may not want all of the above, see [Customizing static analysis](https://dart.dev/guides/language/analysis-options) for more info.