import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:the_process/actions/redux_action.dart';
import 'package:the_process/models/navigation/page_data/page_data.dart';

part 'push_page_action.freezed.dart';
part 'push_page_action.g.dart';

@freezed
class PushPageAction with _$PushPageAction, ReduxAction {
  factory PushPageAction({required PageData data}) = _PushPageAction;

  factory PushPageAction.fromJson(Map<String, dynamic> json) =>
      _$PushPageActionFromJson(json);
}
