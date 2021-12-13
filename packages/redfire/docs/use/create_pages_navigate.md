# Creating pages & navigating

[< README](../../README.md)

## Introduction

The `rf_page` snippet creates 3 classes, with the name coming from the file, eg:

> `x_page.dart` will result in `XPage`, `XPageData` & `XPageTransforms` classes. 

The classes are related by:

- An `XPage` is constructed from an `XPageData`
- An `XPageTransforms` provides functions that
  - create a `XPageData` from a json string
  - create a `MaterialPage` (that can be added to the Navigator stack) from an `XPageData`

We add an `XPageTransforms` object to the `AppWidget`'s `pageTransforms`, which means that when a `PushPageDataAction` action is dispatched with an `XPageData`, ie.

```Dart
context.dispatch(PushPageAction(XPageData(param: 1)));
```

the `XPageData` is used to create an `AuthPage` which is then pushed onto the Navigator stack.

## Step by step guide

1. In a folder named (eg.) `pages` create a file named (eg.) `auth_page.dart`
1. Use snippet `rf_page` to generate `AuthPage`, `AuthPageData` & `AuthPageTransforms` classes.
1. Add desired members to `AuthPageData` & use them to do things in `AuthPage`
    1. if not needed, you may want to remove `AuthPageData` and not use it when creating the `Page`
1. Add a transforms object to the list, eg:

```Dart
AppWidget(..., pageTransforms: [..., BlahPageDataTransforms(),]);
```

Now we can use:

- `dispatch(PushPageAction(BlahPageData()))` to push the Page onto the stack
- `dispatch(RemoveCurrentPageAction())` to pop a Page
