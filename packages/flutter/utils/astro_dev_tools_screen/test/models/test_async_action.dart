import 'package:astro/astro.dart';
import 'package:astro_dev_tools_screen/astro_dev_tools_screen.dart';

class TestAsyncAction extends AsyncAction<DevToolsState> {
  @override
  Future<void> launch(Store<DevToolsState> store) async {}

  @override
  toJson({int? parentId}) => {
        'name_': 'TestAsyncAction',
        'type_': 'async',
        'id_': hashCode,
        'parent_': parentId
      };
}
