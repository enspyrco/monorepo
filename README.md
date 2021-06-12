# redfire

A Redux based architecture connected to Firebase streams.

[Notes](https://docs.google.com/document/d/1rBQXUmoKRiEMn_fNqlosWEt30sysB9-d4ucPWcVn8QI/edit?usp=sharing)

## Setup 

- [Add required code](docs/setup-code.md)
- [Configure platform settings](docs/setup-settings.md)
- Configure Apple Sign In, follow: [apple-sign-in-flutter-firebase](https://github.com/nickmeinhold/apple-sign-in-flutter-firebase) 

### Redux DevTools

We added a custom plugin to the Flutter DevTools for visualising how state change flows through a Redux app. You can clone then install it with: 

```sh
git clone https://github.com/nickmeinhold/devtools.git devtools_with_redux
dart pub global activate --source path <path to devtools_with_redux>/tool
```

An example of the install line is:

```sh
dart pub global activate --source path /Users/nick/git/languages/dart/contributing/devtools/tool
```

> If later you want to change back to the original Flutter DevTools you can just enter:
> - `dart pub global activate devtools`

## Widgets 

The AppState for each package using `redfire` is required to use RedFireState as a mixin.

When using widgets from `redfire`, a type parameter of the store's state must be used, ie. Widget<RedFireAppState>.  This is so that the parameterised StoreConnector<AppState, Output> can find the StoreProvider<RedFireAppState>.
