# Add required code

[< README]

## Add redfire_options.dart

```Dart
/// Mirrors the structure of [firebase_options.dart] and includes the
/// [FirebaseOptions] object for the current platform, using composition
/// to provide an extra layer of config options to the [FirebaseOptions].
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;
import 'package:redfire/utils.dart';

import 'firebase_options.dart';

class RedFireOptions {
  static RedFireConfig get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    // ignore: missing_enum_constant_in_switch
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
    }

    throw UnsupportedError(
      'RedFireOptions are not supported for this platform.',
    );
  }

  static RedFireConfig web = RedFireConfig(
      firebase: DefaultFirebaseOptions.currentPlatform,
      auth: const AuthOptions(
          clientId: 'key goes here'));

  static RedFireConfig android = RedFireConfig(
      firebase: DefaultFirebaseOptions.currentPlatform,
      // clientId not needed for Android
      auth: const AuthOptions());

  static RedFireConfig ios = RedFireConfig(
      firebase: DefaultFirebaseOptions.currentPlatform,
      auth: const AuthOptions());

  static RedFireConfig macos = RedFireConfig(
      firebase: DefaultFirebaseOptions.currentPlatform,
      auth: const AuthOptions());
}
```

## Add to pubspec.yaml

We need the `redfire` package and...

### required

- `fast_immutable_collections` because we need an AppState that ‘extends’ RedFireState which uses an IList (could we use Iterable instead?)
- `freezed` & `json_serializable` because that’s how we implement AppState

#### optional

- `flutter_redux` if you want to add your own StoreConnector widgets
- `redux` if you want to add your own Middleware/Reducers
EDIT: some of these are optional

### Current location of redfire & redfire_test packages

At the time of writing the packages are in a monorepo and are not published and we cannot use a git dependency that in turns contains a path dependency, so the only option is to clone https://github.com/enspyrco/monorepo so you have a local copy and using a path dependency like this:

```yml
dependencies:
...
  redfire:
    path: ../monorepo/packages/redfire
  freezed_annotation:
  json_annotation: ^4.4.0
  redux:
  flutter_redux:
  fast_immutable_collections:
 
dev_dependencies:
...
  redfire_test:
    path: ../monorepo/packages/redfire_test
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
  config: RedFireOptions.currentPlatform,
  initialState: AppState.init(),
  initialActions: const [],
  middlewares: const [],
  reducers: const [],
  pageTransforms: const [],
  title: <Your App Title>, // optional, defaults to 'Title Note Set'
  homePage: <Home Page>, // shown on successful authentication
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

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('HomePage'));
  }
}
```

### Add a loading spinner for web

<details>
<summary>Make a file "spinner.css" in web/ with contents:</summary>
<br>

```css
#centerOfScreen {
    position: absolute;
    top: 50%;
    left: 50%;
}
.lds-ellipsis {
  display: inline-block;
  position: relative;
  width: 80px;
  height: 80px;
}
.lds-ellipsis div {
  position: absolute;
  top: 33px;
  width: 13px;
  height: 13px;
  border-radius: 50%;
  background: #999;
  animation-timing-function: cubic-bezier(0, 1, 1, 0);
}
.lds-ellipsis div:nth-child(1) {
  left: 8px;
  animation: lds-ellipsis1 0.6s infinite;
}
.lds-ellipsis div:nth-child(2) {
  left: 8px;
  animation: lds-ellipsis2 0.6s infinite;
}
.lds-ellipsis div:nth-child(3) {
  left: 32px;
  animation: lds-ellipsis2 0.6s infinite;
}
.lds-ellipsis div:nth-child(4) {
  left: 56px;
  animation: lds-ellipsis3 0.6s infinite;
}
@keyframes lds-ellipsis1 {
  0% {
    transform: scale(0);
  }
  100% {
    transform: scale(1);
  }
}
@keyframes lds-ellipsis3 {
  0% {
    transform: scale(1);
  }
  100% {
    transform: scale(0);
  }
}
@keyframes lds-ellipsis2 {
  0% {
    transform: translate(0, 0);
  }
  100% {
    transform: translate(24px, 0);
  }
}
```

</details>

<details>
<summary>Add the spinner to "index.html":</summary>
<br>

In `<head>` add:

```html
<link rel="stylesheet" href="spinner.css">
```

In `<body>` add:

```html
<!-- Add a loading spinner in the center of the screen -->
<div id="centerOfScreen" class="lds-ellipsis"><div></div><div></div><div></div><div></div></div>
```

</details>

[< README]: ../../README.md
