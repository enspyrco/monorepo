import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:redfire/types.dart';

part 'project_state.freezed.dart';
part 'project_state.g.dart';

@freezed
class ProjectState with _$ProjectState, ReduxState {
  static const String className = 'ProjectState';

  const ProjectState._();
  const factory ProjectState({
    required String id,
    required String name,
    required ISet<String> ownerIds,
    required ISet<String> adminIds,
    required ISet<String> memberIds,
    required ISet<String> organisationIds,
    required ISet<String> sectionIds,
  }) = _ProjectState;

  factory ProjectState.fromJson(JsonMap json) => _$ProjectStateFromJson(json);

  factory ProjectState.init({required String name}) => ProjectState(
        id: '',
        name: name,
        ownerIds: ISet(),
        adminIds: ISet(),
        memberIds: ISet(),
        organisationIds: ISet(),
        sectionIds: ISet(),
      );

  @override
  String get typeName => className;
}
