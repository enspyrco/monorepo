import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:the_process/enums/auth/authorization_step.dart';
import 'package:the_process/enums/auth/provider_name.dart';

part 'profile_data.freezed.dart';
part 'profile_data.g.dart';

@freezed
class ProfileData with _$ProfileData {
  factory ProfileData({
    required String id,
    String? displayName,
    String? photoURL,
    String? firstName,
    String? lastName,
    required Map<ProviderName, AuthorizationStep> authorizationStatus,
  }) = _ProfileData;

  factory ProfileData.fromJson(Map<String, dynamic> json) =>
      _$ProfileDataFromJson(json);
}
