# Install Redux DevTools

[< README](../README.md)

We added a custom plugin to Flutter DevTools for visualising how state change flows through a Redux app. You can clone and install it with:

```sh
git clone https://github.com/nickmeinhold/devtools.git devtools_with_redux && cd devtools_with_redux
git checkout -b redfire_plugin origin/redfire_plugin
./rebuild.sh
```

> If later you want to change back to the original Flutter DevTools you can just enter:
>
> - `dart pub global activate devtools`

If you use VS Code and want the DevTools to open every time you can update `settings.json` with:

```yaml
{
  ...
  "dart.openDevTools": "always",
  "dart.embedDevTools": false,
  ...
}
```

## Issue with embedded DevTools

- the embedded version of the DevTools currently uses a hardcoded set of tabs
- our addition to the DevTools lives in it's own tab
- hence the embedded version won't show our Redux DevTools tab
- *we have filed an issue to get this sorted*

## Updating DevTools

- sync the fork
- rebase the `redfire_plugin` branch onto master
- force push the branch: `git push -f origin redfire_plugin`
- other repos should delete the local branch and checkout `origin/redfire_plugin`

### Rebuild

If you added the alias (see below):

```sh
devtools_rebuild
```

## Bumping the DevTools versions

In order for VS Code to use our customised DevTools the version should be equal or higher than the one on pub.  The current pub version is [here](https://pub.dev/packages/devtools/changelog) and the current repo version is [here](https://github.com/flutter/devtools/blob/master/packages/devtools/CHANGELOG.md).

You can increase the version number [here](https://github.com/flutter/devtools/blob/master/packages/devtools/pubspec.yaml#L11) in the local copy, and then VS Code should not re-activate it. It's fine for it to be the same as the one on pub, as VS Code will only re-activate it if there's a newer version on pub.

## Alias' for rebuild/activate

You can add alias' to iterate faster (update path for your system):

```sh
alias devtools_activate="dart pub global activate --source path /.../devtools/packages/devtools"
alias devtools_rebuild="cd /.../devtools && ./tool/update_flutter_sdk.sh && ./rebuild.sh && dart pub global activate --source path ./packages/devtools"
```

> ** Note: You may need to restart VS Code to see the updated version of DevTools
