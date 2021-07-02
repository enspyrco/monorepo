import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:redfire/src/types/redux_action.dart';
import 'package:redfire/types.dart';

part 'get_authorized_action.freezed.dart';
part 'get_authorized_action.g.dart';

@freezed
class GetAuthorizedAction with _$GetAuthorizedAction, ReduxAction {
  factory GetAuthorizedAction({required ProvidersEnum provider}) =
      _GetAuthorizedAction;

  factory GetAuthorizedAction.fromJson(Map<String, dynamic> json) =>
      _$GetAuthorizedActionFromJson(json);
}
