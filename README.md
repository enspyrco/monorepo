# redfire

A Redux based architecture connected to Firebase streams.

[Notes](https://docs.google.com/document/d/1rBQXUmoKRiEMn_fNqlosWEt30sysB9-d4ucPWcVn8QI/edit?usp=sharing)

## Setup 

- [Add required code](docs/setup-code.md)
- [Configure platform settings](docs/setup-settings.md)
- Configure Apple Sign In, follow: [apple-sign-in-flutter-firebase](https://github.com/nickmeinhold/apple-sign-in-flutter-firebase) 

### Optional setup 
- [Add snippets](docs/add-snippets.md) to save you time if you plan to add your own actions, reducers or middleware
- [Install Redux DevTools](docs/redux-devtools.md) if you want to visualise how state change flows through the app 

## Widgets 

The AppState for each package using `redfire` is required to use RedFireState as a mixin.

When using widgets from `redfire`, a type parameter of the store's state must be used, ie. Widget<RedFireAppState>.  This is so that the parameterised StoreConnector<AppState, Output> can find the StoreProvider<RedFireAppState>.
