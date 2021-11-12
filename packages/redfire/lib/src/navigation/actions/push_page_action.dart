import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:redfire/src/navigation/models/page_data.dart';
import 'package:redfire/src/types/redux_action.dart';
import 'package:redfire/src/types/typedefs.dart';

part 'push_page_action.freezed.dart';
part 'push_page_action.g.dart';

@freezed
class PushPageAction with _$PushPageAction, ReduxAction {
  PushPageAction._();
  const factory PushPageAction(@PageDataConverter() PageData page) =
      _PushPageAction;

  factory PushPageAction.fromJson(JsonMap json) =>
      _$PushPageActionFromJson(json);

  @override
  String get typeName => 'PushPageAction';
}
