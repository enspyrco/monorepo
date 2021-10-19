import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:redfire/types.dart';

part 'organisation_model.freezed.dart';
part 'organisation_model.g.dart';

@freezed
class OrganisationModel with _$OrganisationModel, ReduxModel {
  factory OrganisationModel({
    // A unique id, current implementation is the firestore document id
    required String id,
    required String name,
    required ISet<String> ownerIds,
    required ISet<String> adminIds,
    required ISet<String> memberIds,
  }) = _Organisation;

  factory OrganisationModel.fromJson(JsonMap json) =>
      _$OrganisationModelFromJson(json);

  factory OrganisationModel.init({required String name}) => OrganisationModel(
        id: '', // temporary value indicating not saved to DB yet
        name: name,
        ownerIds: ISet(),
        adminIds: ISet(),
        memberIds: ISet(),
      );
}
