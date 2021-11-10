import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:redfire/types.dart';

part 'pop_all_pages_action.freezed.dart';
part 'pop_all_pages_action.g.dart';

@freezed
class PopAllPagesAction with _$PopAllPagesAction, ReduxAction {
  const factory PopAllPagesAction() = _PopAllPagesAction;

  factory PopAllPagesAction.fromJson(JsonMap json) =>
      _$PopAllPagesActionFromJson(json);
}
