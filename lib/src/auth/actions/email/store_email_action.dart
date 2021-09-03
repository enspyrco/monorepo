import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:redfire/types.dart';

part 'store_email_action.freezed.dart';
part 'store_email_action.g.dart';

@freezed
class StoreEmailAction with _$StoreEmailAction, ReduxAction {
  factory StoreEmailAction(String? text) = _StoreEmailAction;

  factory StoreEmailAction.fromJson(JsonMap json) =>
      _$StoreEmailActionFromJson(json);
}
