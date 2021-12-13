# Troubleshooting

## Common Problems & Solutions

### I'm stuck with a build error that mentions the Podfile

Try:

```sh
flutter clean
pod repo update
cd macos
pod update
```

### Why do I get errors about not finding StoreProvider?

We parameterise the extension methods with `<T extends RedFireState>` so they must be used with `<AppState>` so that the `StoreProvider<AppState>` can be found, ie use:

```Dart
store.dispatch<AppState>(...) 
```
