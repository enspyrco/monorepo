import 'package:redaux/redaux.dart';
import 'package:redaux_dev_tools_screen/redaux_dev_tools_screen.dart';

class TestAsyncAction extends AsyncAction<DevToolsState> {
  @override
  Middleware<DevToolsState> get middleware =>
      _TestAsyncActionMiddleware.instance;

  @override
  toJson({int? parentId}) => {
        'name_': 'TestAsyncAction',
        'type_': 'async',
        'id_': hashCode,
        'parent_': parentId
      };
}

class _TestAsyncActionMiddleware extends Middleware<DevToolsState> {
  @override
  void call(store, covariant TestAsyncAction action) async {
    // doesn't do anything
  }

  static final instance = _TestAsyncActionMiddleware();
}
