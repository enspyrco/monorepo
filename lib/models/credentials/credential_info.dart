import 'package:freezed_annotation/freezed_annotation.dart';

part 'credential_info.freezed.dart';
part 'credential_info.g.dart';

@freezed
class CredentialInfo with _$CredentialInfo {
  @JsonSerializable(explicitToJson: true)
  factory CredentialInfo({
    required String uid,
    String? token,
    String? displayName,
    String? photoURL,
  }) = _CredentialInfo;

  factory CredentialInfo.fromJson(Map<String, dynamic> json) =>
      _$CredentialInfoFromJson(json);
}
