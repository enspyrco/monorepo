import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:redfire/navigation/models/red_fire_page.dart';
import 'package:redfire/types/redux_action.dart';

part 'push_page_action.freezed.dart';
part 'push_page_action.g.dart';

@freezed
class PushPageAction with _$PushPageAction, ReduxAction {
  factory PushPageAction({required RedFirePage data}) = _PushPageAction;

  factory PushPageAction.fromJson(Map<String, dynamic> json) =>
      _$PushPageActionFromJson(json);
}
