import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:redfire/types.dart';
import 'package:the_process/models/project_sections/project_section.dart';

part 'store_project_sections_action.freezed.dart';
part 'store_project_sections_action.g.dart';

@freezed
class StoreProjectSectionsAction
    with _$StoreProjectSectionsAction, ReduxAction {
  factory StoreProjectSectionsAction({required IList<ProjectSection> list}) =
      _StoreProjectSectionsAction;

  factory StoreProjectSectionsAction.fromJson(Map<String, dynamic> json) =>
      _$StoreProjectSectionsActionFromJson(json);
}
