# Gory details

[< README]

See also: [future work] where we are reducing the gore.

## Project Structure

### Locations assumed by snippets

- `AppState` lives in `lib/app_state.dart`
- `main_page.dart` lives in `lib/pages/`

## Widgets

The AppState for each package using `redfire` is required to use RedFireState as a mixin.

When using widgets from `redfire`, a type parameter of the store's state must be used, ie. `Widget<AppState>`.  This is so that the `AppState` type parameter is used in any of the widget's child `StoreConnector<AppState, Output>` widgets, and they can in turn find the `StoreProvider<AppState>`.

## Architecture

### Data flow

A common flow of data is:

- Widget dispatches Actions→(redfire)→AppState→Widget via a flutter_redux StoreConnector

### Polymorphism

The `ReduxState`, `Action` & `PageData` subtypes created with the snippets have a static `className` member, and an instance member `typeName` that refers to the static member.  

This structure allows polymorphism while using `freezed` and `json_serializable`.  Each object has a getter that accesses a static class member, that holds a String of the actual class name so `toJson` puts the class name into the json then going in the other direction, we use a `JsonConverter` that looks for the class name in the json and creates the correct type of object.

The same structure allows us to easily get the type of a `PageData` in the `AppState`'s `pages` at runtime so we can find the appropriate `toMaterialPage()` function.

[< README]: ../README.md
[Future work]: ./future-work.md