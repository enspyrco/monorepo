import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../types.dart';

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
    required Map<ProvidersEnum, AuthorizationEnum> authorizationStatus,
  }) = _ProfileData;

  factory ProfileData.fromJson(JsonMap json) => _$ProfileDataFromJson(json);
}
