import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:redfire/src/auth/enums/providers_enum.dart';
import 'package:redfire/src/types/redux_action.dart';
import 'package:redfire/src/types/typedefs.dart';

part 'get_authorized_action.freezed.dart';
part 'get_authorized_action.g.dart';

@freezed
class GetAuthorizedAction with _$GetAuthorizedAction, ReduxAction {
  factory GetAuthorizedAction({required ProvidersEnum provider}) =
      _GetAuthorizedAction;

  factory GetAuthorizedAction.fromJson(JsonMap json) =>
      _$GetAuthorizedActionFromJson(json);
}
