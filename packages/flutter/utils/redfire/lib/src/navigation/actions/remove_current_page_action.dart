import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_types/json_types.dart';

import '../../types/redux_action.dart';

part 'remove_current_page_action.freezed.dart';
part 'remove_current_page_action.g.dart';

@freezed
class RemoveCurrentPageAction with _$RemoveCurrentPageAction, ReduxAction {
  const RemoveCurrentPageAction._();
  const factory RemoveCurrentPageAction() = _RemoveCurrentPageAction;

  factory RemoveCurrentPageAction.fromJson(JsonMap json) =>
      _$RemoveCurrentPageActionFromJson(json);

  @override
  String get typeName => 'RemoveCurrentPageAction';
}
