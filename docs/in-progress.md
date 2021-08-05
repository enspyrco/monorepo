# In Progress

[< README](../README.md)

## Why do I get errors about not finding StoreProvider?

We parameterise the functions with <T extends RedFireState> and then they must be used with `AppState` as a type parameter (eg.)

```Dart
dispatch<AppState>(...) 
```

Problems:
- extra typing
- easy to forget as
:warning: this is a runtime error :warning:

### Ideas 
- make an analyzer plugin that checks for the appropriate type parameter
- find the places where we must use <AppState> and find a way around each one, the places are:
  - when using a widget defined in redfire
  - when using an extension defined in redfire (at least when AppState parameter is used in the extension)
  - where else? 