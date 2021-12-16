import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:redfire/types.dart';

import '../../shared/models/adventure_node.dart';

part 'step_model.freezed.dart';
part 'step_model.g.dart';

@freezed
class StepModel with _$StepModel, ReduxState, AdventureNode {
  static const String className = 'StepModel';

  const StepModel._();
  const factory StepModel({String? id, required String name}) = _StepModel;

  factory StepModel.fromJson(JsonMap json) => _$StepModelFromJson(json);

  @override
  String get typeName => className;
}
