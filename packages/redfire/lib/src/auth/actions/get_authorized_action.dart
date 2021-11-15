import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:redfire/types.dart';

part 'get_authorized_action.freezed.dart';
part 'get_authorized_action.g.dart';

@freezed
class GetAuthorizedAction with _$GetAuthorizedAction, ReduxAction {
  const GetAuthorizedAction._();
  const factory GetAuthorizedAction({required ProvidersEnum provider}) =
      _GetAuthorizedAction;

  factory GetAuthorizedAction.fromJson(JsonMap json) =>
      _$GetAuthorizedActionFromJson(json);

  @override
  String get typeName => 'GetAuthorizedAction';
}
