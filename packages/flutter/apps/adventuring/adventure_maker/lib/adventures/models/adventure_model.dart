import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:redfire/types.dart';

import '../../shared/models/adventure_node.dart';

part 'adventure_model.freezed.dart';
part 'adventure_model.g.dart';

@freezed
class AdventureModel with _$AdventureModel, ReduxState, AdventureNode {
  static const String className = 'AdventureModel';

  const AdventureModel._();
  const factory AdventureModel({
    String? id,
    required String name,
  }) = _AdventureModel;

  factory AdventureModel.fromJson(JsonMap json) =>
      _$AdventureModelFromJson(json);

  @override
  String get typeName => className;
}
