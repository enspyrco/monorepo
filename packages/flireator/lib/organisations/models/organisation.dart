import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:redfire/types.dart';

part 'organisation.freezed.dart';
part 'organisation.g.dart';

@freezed
class Organisation with _$Organisation, ReduxModel {
  factory Organisation({
    required String name,
    ISet<String>? owners,
    ISet<String>? admins,
    ISet<String>? members,
  }) = _Organisation;

  factory Organisation.fromJson(JsonMap json) => _$OrganisationFromJson(json);
}
