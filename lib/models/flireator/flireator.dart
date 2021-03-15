import 'package:flireator/models/credentials/credential_info.dart';
import 'package:flireator/models/flireator/config_options.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';

part 'flireator.freezed.dart';
part 'flireator.g.dart';

@freezed
class Flireator with _$Flireator {
  factory Flireator(
      {required String id,
      required String displayName,
      required String photoURL,
      ConfigOptions? configOptions,
      required IMap<String, CredentialInfo> credentials}) = _Flireator;

  factory Flireator.fromJson(Map<String, dynamic> json) =>
      _$FlireatorFromJson(json);
}
