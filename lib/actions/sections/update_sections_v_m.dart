library update_sections_v_m;

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:the_process/actions/redux_action.dart';
import 'package:the_process/serializers.dart';

part 'update_sections_v_m.g.dart';

abstract class UpdateSectionsVM extends Object
    with ReduxAction
    implements Built<UpdateSectionsVM, UpdateSectionsVMBuilder> {
  bool get creatingNewSection;

  UpdateSectionsVM._();

  factory UpdateSectionsVM({required bool creatingNewSection}) =
      _$UpdateSectionsVM._;

  factory UpdateSectionsVM.by(
      [void Function(UpdateSectionsVMBuilder) updates]) = _$UpdateSectionsVM;

  Object toJson() =>
      serializers.serializeWith(UpdateSectionsVM.serializer, this);

  // static UpdateSectionsVM fromJson(String jsonString) => serializers
  //     .deserializeWith(UpdateSectionsVM.serializer, json.decode(jsonString));

  static Serializer<UpdateSectionsVM> get serializer =>
      _$updateSectionsVMSerializer;

  @override
  String toString() => 'UPDATE_SECTIONS_V_M';
}
