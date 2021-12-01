import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:redfire/types.dart';

part 'step_model.freezed.dart';
part 'step_model.g.dart';

@freezed
class StepModel with _$StepModel, ReduxModel {
  const factory StepModel({required String name}) = _StepModel;

  factory StepModel.fromJson(JsonMap json) => _$StepModelFromJson(json);
}
