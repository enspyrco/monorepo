# In Progress

[< README](../README.md)

## Why do I get errors about not finding StoreProvider?

We parameterise the extension methods with `<T extends RedFireState>` so they must be used with `<AppState>` so that the `StoreProvider<AppState>` can be found, ie use:

```Dart
store.dispatch<AppState>(...) 
```

Problems:
1. extra typing
2. easy to forget as :warning: this will be a *runtime* error :warning:

### Ideas 
- make an analyzer plugin that checks for the appropriate type parameter
- find the places where we must use <AppState> and find a way around each one, the places are:
  - when using a widget defined in redfire
  - when using an extension defined in redfire (at least when AppState parameter is used in the extension)
  - where else? 