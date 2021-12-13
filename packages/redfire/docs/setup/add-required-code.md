# Add required code

[< README]

## Add to pubspec.yaml

We need the `redfire` package and...

### required

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
  json_annotation: ^4.3.0
  redux:
  flutter_redux:
  fast_immutable_collections:
 
dev_dependencies:
...
  redfire_test:
    git: https://github.com/enspyrco/redfire_test.git
  build_runner:
  freezed:
  json_serializable: ^6.0.1
```

### Update main.dart

```Dart
import 'package:flutter/material.dart';
import 'package:redfire/widgets.dart';
import 'package:the_process/app_state.dart';

void main() => runApp(AppWidget<AppState>(
  initialState: AppState.init(),
  initialActions: const [],
  middlewares: const [],
  reducers: const [],
  pageTransforms: const [],
  title: <Your App Title>, // optional, defaults to 'Title Note Set'
  mainPage: <Main Page Widget>, // shown on successful authentication
));
```

### Add lib/app_state.dart

```Dart
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter/widgets.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:redfire/types.dart';
import 'package:redfire/widgets.dart';

part 'main.freezed.dart';
part 'main.g.dart';

@freezed
class AppState with _$AppState, RedFireState {
  factory AppState({
    /// RedFire AppState members
    required AuthState auth,
    @PageDataConverter() required IList<PageData> pages,
    required IList<ProblemInfo> problems,
    required Settings settings,
    ProfileData? profile,

    /// Additional AppState members
  }) = _AppState;
 
 factory AppState.init() => AppState(
    /// RedFire init code
    auth: AuthState.init(),
    pages: <PageData>[InitialPageData()].lock,
    problems: IList(),
    settings: Settings.init(),
    
    /// Additional init code
  );
 
  factory AppState.fromJson(JsonMap json) =>
    _$AppStateFromJson(json);
}
```

### Add pages/main_page.dart

```Dart
import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('MainPage'));
  }
}
```

### Ignore generated files

Add to `.gitignore` (delete any commited generated files & commit first):

```sh
# Generated files
*.g.dart
*.freezed.dart
*.mocks.dart
```

### Configure static analysis

Add to `analysis_options.yaml`:

```yaml
analyzer:
  exclude: 
    - build/**
    - lib/*.g.dart
    - lib/*.freezed.dart
    - lib/**/*.g.dart
    - lib/**/*.freezed.dart
    - test/**/*.mocks.dart
  strong-mode:
    implicit-casts: false
    implicit-dynamic: false
```

You may not want all of the above, see [Customizing static analysis](https://dart.dev/guides/language/analysis-options) for more info.

### (optionally) Hide generated & irrelevant files

#### VS Code

Add `settings.json` with the following to the `.vscode` folder:

```json
{
  "files.exclude": {
    "**/*.g.dart": true,
    "**/*.freezed.dart": true,
    // "build": true,
    // ".flutter-plugins": true,
    // ".flutter-plugins-dependencies": true,
    // ".metadata": true,
    // ".packages": true,
    // "CHANGELOG.md": true,
    // "LICENSE": true,
    // "lib/generated_plugin_registrant.dart": true,
  }
}
```

### (possibly) Add a `build.yaml` with `explicit_to_json: true`

If you are using `fast_immutable_collections` and get errors serializing classes with list members, create a `build.yaml` file and add the following (the defaults + explicit_to_json: true)

- For more info see: <https://pub.dev/packages/json_serializable#build-configuration>

```yaml
targets:
  $default:
    builders:
      json_serializable:
        options:
          # Options configure how source code is generated for every
          # `@JsonSerializable`-annotated class in the package.
          #
          # The default value for each is listed, but with 
          # explicit_to_json: true so FIC collections will serialize
          any_map: false
          checked: false
          create_factory: true
          create_to_json: true
          disallow_unrecognized_keys: false
          explicit_to_json: true
          field_rename: none
          generic_argument_factories: false
          ignore_unannotated: false
          include_if_null: true
```

This is needed because `freezed` generates the toJson. In the [FIC example](https://github.com/marcglasberg/fast_immutable_collections#11-json-support) they have an explicit toJson added manually.

We can look into better ways around this if it is problematic.

### (possibly) Add a launch configuration for web that uses port 5000

```json
{
  "name": "web",
  "request": "launch",
  "type": "dart",
  "deviceId": "chrome",
  "args": ["--web-hostname", "localhost", "--web-port", "5000"]
},
```

[< README]: ../../README.md