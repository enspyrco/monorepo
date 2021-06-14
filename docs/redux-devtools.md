# Install Redux DevTools

[< README](../README.md)

We added a custom plugin to Flutter DevTools for visualising how state change flows through a Redux app. You can clone and install it with: 

```sh
git clone https://github.com/nickmeinhold/devtools.git devtools_with_redux && cd devtools_with_redux
./tool/build_release.sh
dart pub global activate --source path ./packages/devtools
```

> If later you want to change back to the original Flutter DevTools you can just enter:
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

### Issue with embedded DevTools 

- the embedded version of the DevTools currently uses a hardcoded set of tabs 
- our addition to the DevTools lives in it's own tab 
- hence the embedded version won't show our Redux DevTools tab 
- *we have filed an issue to get this sorted* 