# redfire

A Redux based architecture connected to Firebase streams.

[Notes](https://docs.google.com/document/d/1rBQXUmoKRiEMn_fNqlosWEt30sysB9-d4ucPWcVn8QI/edit?usp=sharing)

## Setup 

- [Setup RedFire](docs/setup-redfire.md)
- [Setup GitHub](docs/setup-github.md)
- [Configure Firebase](docs/setup-firebase.md)
- [Setup Auth](docs/setup-auth.md)
- [Setup CI/CD](docs/setup-cicd.md)
- [Setup Databases](docs/setup-databases.md)

### Optional setup

- Use code snippets to save you *lots* of time & hassle
  - *VS Code*: copy the `.vscode/project.code-snippets` file from the redfire package into your project
- [Install Redux DevTools](docs/redux-devtools.md) if you want to visualise how state change flows through the app 

## Widgets 

The AppState for each package using `redfire` is required to use RedFireState as a mixin.

When using widgets from `redfire`, a type parameter of the store's state must be used, ie. Widget<RedFireAppState>.  This is so that the parameterised StoreConnector<AppState, Output> can find the StoreProvider<RedFireAppState>.

## In Progress

See [In Progress](docs/in-progress.md) for discussion of current work and future plans.

## Using in your app

### Naming

A `Page` is something that has corresponding objects of type `PageData` (stored in the AppState) and `MaterialPage` (passed to the Navigator to create the navigation stack).

### Navigation

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