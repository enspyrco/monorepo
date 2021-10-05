# redfire

[< monorepo](../../README.md)

*A Redux based architecture connected to Firebase streams.*

[Project Notes](https://enspyrco.notion.site/RedFire-406c10fbadfb44e3a6f2806a1b6023bf)

## Setup

- [Setup RedFire](docs/setup-redfire.md)
- [Setup GitHub](docs/setup-github.md)
- [Configure Firebase](docs/configure-firebase.md)
- [Setup Auth](docs/setup-auth.md)
- [Setup CI/CD](docs/setup-cicd.md)
- [Setup Databases](docs/setup-databases.md)

### Project Structure

#### Suggestions

-  the only things in `main.dart` are `AppState` and `runApp(AppWidget(...));`

#### Assumed (by snippets)

- `AppState` lives in `main.dart`
- `main_page.dart` lives in `lib/pages/`

### Optional setup

Use code snippets to save you *lots* of time & hassle

- *VS Code*: 
  - copy the `.vscode/project.code-snippets` file from the redfire package into your project
  - some snippets need to be changed slightly as they are designed for use by redfire... TODO: update here (longer term this will be handled by flireator)

[Install Redux DevTools](docs/redux-devtools.md) if you want to visualise how state change flows through the app 

## Widgets 

The AppState for each package using `redfire` is required to use RedFireState as a mixin.

When using widgets from `redfire`, a type parameter of the store's state must be used, ie. `Widget<AppState>`.  This is so that the `AppState` type parameter is used in any of the widget's child `StoreConnector<AppState, Output>` widgets, and they can in turn find the `StoreProvider<AppState>`.

## In Progress

See [In Progress](docs/in-progress.md) for discussion of current work and future plans.

## Using in your app

### Naming

#### Page

A `Page` is something that has corresponding objects of type `PageData` (stored in the AppState) and `MaterialPage` (passed to the Navigator to create the navigation stack).

### Navigation

`PageData` subtypes are assumed to have a static `staticTypeName` member
and an instance member `typeName` that refers to the static member.  Using the snippets will create this automatically.
- this allows us to easily get the type of a `PageData` in the `AppState`'s `pages` at runtime so we can find the appropriate toMaterialPage function

Still very much a work in progress and very clunky, but...

- make a file called just `blah.dart` in the case where you have `BlahPage` and `BlahPageData`
- use the `page_data_transforms` snippet
- auto add missing imports 
- if needed, cast `pageData` to `BlahPageData` and use it to create the `Page`
- rename `blah.dart` to `blah_page_data_transforms.dart`
- add `BlahPageDataTransforms()` to `AppWidget(..., pageTransforms: _)`
- use 
  - `dispatch<AppState>(PushPageAction(BlahPageData()))` to push the Page onto the stack
  - `dispatch<AppState>(RemoveCurrentPageAction())` to pop a Page

### Testing 

See [Testing](docs/testing.md)