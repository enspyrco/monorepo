import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:the_process/actions/redux_action.dart';
import 'package:the_process/models/profile/profile_data.dart';

part 'store_profile_data_action.freezed.dart';
part 'store_profile_data_action.g.dart';

@freezed
class StoreProfileDataAction with _$StoreProfileDataAction, ReduxAction {
  factory StoreProfileDataAction({required ProfileData data}) =
      _StoreProfileDataAction;

  factory StoreProfileDataAction.fromJson(Map<String, dynamic> json) =>
      _$StoreProfileDataActionFromJson(json);
}
