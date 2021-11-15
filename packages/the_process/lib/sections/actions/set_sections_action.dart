import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:redfire/types.dart';
import 'package:the_process/projects/models/section_model.dart';

part 'set_sections_action.freezed.dart';
part 'set_sections_action.g.dart';

@freezed
class SetSectionsAction with _$SetSectionsAction, ReduxAction {
  const SetSectionsAction._();
  const factory SetSectionsAction({required IList<SectionModel> list}) =
      _SetSectionsAction;

  factory SetSectionsAction.fromJson(JsonMap json) =>
      _$SetSectionsActionFromJson(json);

  @override
  String get typeName => 'SetSectionsAction';
}
