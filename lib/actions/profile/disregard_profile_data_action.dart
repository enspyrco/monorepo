import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:the_process/actions/redux_action.dart';

part 'disregard_profile_data_action.freezed.dart';
part 'disregard_profile_data_action.g.dart';

@freezed
class DisregardProfileDataAction
    with _$DisregardProfileDataAction, ReduxAction {
  factory DisregardProfileDataAction() = _DisregardProfileDataAction;

  factory DisregardProfileDataAction.fromJson(Map<String, dynamic> json) =>
      _$DisregardProfileDataActionFromJson(json);
}
