import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:the_process/actions/redux_action.dart';

part 'remove_current_page_action.freezed.dart';
part 'remove_current_page_action.g.dart';

@freezed
class RemoveCurrentPageAction with _$RemoveCurrentPageAction, ReduxAction {
  factory RemoveCurrentPageAction() = _RemoveCurrentPageAction;

  factory RemoveCurrentPageAction.fromJson(Map<String, dynamic> json) =>
      _$RemoveCurrentPageActionFromJson(json);
}
