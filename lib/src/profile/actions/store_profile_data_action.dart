import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:redfire/src/profile/models/profile_data.dart';
import 'package:redfire/types.dart';

part 'store_profile_data_action.freezed.dart';
part 'store_profile_data_action.g.dart';

@freezed
class StoreProfileDataAction with _$StoreProfileDataAction, ReduxAction {
  factory StoreProfileDataAction({required ProfileData data}) =
      _StoreProfileDataAction;

  factory StoreProfileDataAction.fromJson(JsonMap json) =>
      _$StoreProfileDataActionFromJson(json);
}
