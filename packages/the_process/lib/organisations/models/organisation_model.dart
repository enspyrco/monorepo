import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:redfire/types.dart';

part 'organisation_model.freezed.dart';
part 'organisation_model.g.dart';

@freezed
class OrganisationModel with _$OrganisationModel, ReduxModel {
  factory OrganisationModel({
    required String id,
    required String name,
    ISet<String>? owners,
    ISet<String>? admins,
    ISet<String>? members,
  }) = _Organisation;

  factory OrganisationModel.fromJson(JsonMap json) =>
      _$OrganisationModelFromJson(json);
}
