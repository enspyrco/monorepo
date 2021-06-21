# Add code snippets

[< README](../README.md)

Add a file at `.vscode/project.code-snippets` with contents: 

```json
{   
  "freezed model": {
    "prefix": "freezed_model",
    "body": [
      "import 'package:freezed_annotation/freezed_annotation.dart';",
      "import 'package:redfire/types.dart';",
      "",
      "part '${TM_FILENAME_BASE}.freezed.dart';",
      "part '${TM_FILENAME_BASE}.g.dart';",
      "",
      "@freezed",
      "class ${TM_FILENAME_BASE/(.*)/${1:/pascalcase}/g} with _$${TM_FILENAME_BASE/(.*)/${1:/pascalcase}/g}, ReduxModel  {",
      "\tfactory ${TM_FILENAME_BASE/(.*)/${1:/pascalcase}/g}({ ${1} }) = _${TM_FILENAME_BASE/(.*)/${1:/pascalcase}/g};",
      "",
      "factory ${TM_FILENAME_BASE/(.*)/${1:/pascalcase}/g}.fromJson(Map<String, Object?> json) => _$${TM_FILENAME_BASE/(.*)/${1:/pascalcase}/g}FromJson(json);",
      "}"
    ],
    "description": "freezed model"
  },
  "freezed action": {
    "prefix": "freezed_action",
    "body": [
      "import 'package:freezed_annotation/freezed_annotation.dart';",
      "import 'package:redfire/types.dart';",
      "",
      "part '${TM_FILENAME_BASE}.freezed.dart';",
      "part '${TM_FILENAME_BASE}.g.dart';",
      "",
      "@freezed",
      "class ${TM_FILENAME_BASE/(.*)/${1:/pascalcase}/g} with _$${TM_FILENAME_BASE/(.*)/${1:/pascalcase}/g}, ReduxAction {",
      "\tfactory ${TM_FILENAME_BASE/(.*)/${1:/pascalcase}/g}({${1}}) = _${TM_FILENAME_BASE/(.*)/${1:/pascalcase}/g};",
      "",
      "factory ${TM_FILENAME_BASE/(.*)/${1:/pascalcase}/g}.fromJson(Map<String, Object?> json) => _$${TM_FILENAME_BASE/(.*)/${1:/pascalcase}/g}FromJson(json);",
      "}"
    ],
    "description": "freezed action"
  },
  "middleware class": {
    "prefix": "mdlware - redfire",
    "body": [
      "import 'package:redfire/actions.dart';",
      "import 'package:${WORKSPACE_NAME}/state/app_state.dart';",
      "import 'package:redux/redux.dart';",
      "",
      "class ${TM_FILENAME_BASE/(.*)/${1:/pascalcase}/g}Middleware extends TypedMiddleware<AppState, ${TM_FILENAME_BASE/(.*)/${1:/pascalcase}/g}Action> {",
      "\t${TM_FILENAME_BASE/(.*)/${1:/pascalcase}/g}Middleware(${1/(.*)/${1:/pascalcase}/g}Service ${1}Service) : super((store, action, next) async {",
      "\t\tnext(action);",
      "",
      "\t\tfinal  = await ${1/(.*)/${1:/pascalcase}/g}Service${2};",
      "\t\tstore.dispatch();",
      "\t});",
      "}"
    ],
    "description": "middleware for redfire action"
  },
  "reducer class": {
    "prefix": "reducer - redfire",
    "body": [
      "import 'package:redfire/actions.dart';",
      "import 'package:${WORKSPACE_NAME}/state/app_state.dart';",
      "import 'package:redux/redux.dart';",
      "",
      "class ${TM_FILENAME_BASE/(.*)/${1:/pascalcase}/g}Reducer extends TypedReducer<AppState, ${TM_FILENAME_BASE/(.*)/${1:/pascalcase}/g}Action> {",
      "\t${TM_FILENAME_BASE/(.*)/${1:/pascalcase}/g}Reducer() : super((state, action) => state.copyWith(${1}: action.${1}),);",
      "}",
    ],
    "description": "reducer for redfire action"
  }
}
```