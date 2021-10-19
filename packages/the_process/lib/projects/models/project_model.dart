import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:redfire/types.dart';

part 'project_model.freezed.dart';
part 'project_model.g.dart';

@freezed
class ProjectModel with _$ProjectModel, ReduxModel {
  const factory ProjectModel({
    required String id,
    required String name,
    required ISet<String> ownerIds,
    required ISet<String> adminIds,
    required ISet<String> memberIds,
    required ISet<String> organisationIds,
    required ISet<String> sectionIds,
  }) = _ProjectModel;

  factory ProjectModel.fromJson(JsonMap json) => _$ProjectModelFromJson(json);

  factory ProjectModel.init({required String name}) => ProjectModel(
        id: '',
        name: name,
        ownerIds: ISet(),
        adminIds: ISet(),
        memberIds: ISet(),
        organisationIds: ISet(),
        sectionIds: ISet(),
      );
}
