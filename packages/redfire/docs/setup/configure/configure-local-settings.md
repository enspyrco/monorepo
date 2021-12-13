# Configure local settings

[< README]

## .gitignore

Add

```.gitignore
# Firebase config files
/ios/Runner/GoogleService-Info.plist
/macos/Runner/GoogleService-Info.plist
/android/app/google-services.json
/web/index.html
```

## lints

Optionally: use the redfire lints by updating your `analysis_options.yaml` to

```yaml
include: package:redfire/lints.yaml
```

## snippets

Using code snippets will save you *lots* of time & hassle

*VS Code*:

- copy the `.vscode/project.code-snippets` file from the redfire package into your project
- optionally remove the redfire specific snippets, ie. the ones that end in `_redfire`

[< README]: ../../../README.md
