# Future Work

[< README]

See also: [gory details] where we expose the internals in order to motivate taking away some of the pain.

## Current Problems

### Need to add \<AppState> parameter

1. extra typing
2. easy to forget as :warning: this will be a *runtime* error :warning:

## Ideas

- make an analyzer plugin that checks for the appropriate type parameter
- find the places where we must use `<AppState>` and find a way around each one, the places are:
  - when using a widget defined in redfire
  - when using an extension defined in redfire (at least when AppState parameter is used in the extension)
  - where else?

### Page

Keep in a separate file so we can later use code gen for the surrounding infrastructure (pagedata & transforms) which will refer to the page but regenerating won't wipe user changes to the page?

- Fow now, no: it seems easier & neater for now to keep in one file, and shouldn't be too difficult to change later

### Naming

#### Pages and related types

A `Page` is something that has corresponding objects of type `PageData` (stored in the AppState) and `MaterialPage` (passed to the Navigator to create the navigation stack).

[< README]: ../README.md
[gory details]: ./gory-details.md
