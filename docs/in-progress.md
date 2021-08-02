# In Progress

[< README](../README.md)

## Why must we add extensions in child packages?

If we put them in `redfire` we must parameterise the functions with <T extends RedFireState> and then use them with (eg.)

```Dart
dispatch<AppState>(...) 
```

- extra typing
- easy to forget as
:warning: this is a runtime error :warning: