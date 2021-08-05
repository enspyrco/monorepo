import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:redfire/src/navigation/models/page_data.dart';
import 'package:redfire/src/types/redux_action.dart';

part 'push_page_action.freezed.dart';
part 'push_page_action.g.dart';

@freezed
class PushPageAction with _$PushPageAction, ReduxAction {
  const factory PushPageAction(@PageDataConverter() PageData page) =
      _PushPageAction;

  factory PushPageAction.fromJson(Map<String, dynamic> json) =>
      _$PushPageActionFromJson(json);
}
