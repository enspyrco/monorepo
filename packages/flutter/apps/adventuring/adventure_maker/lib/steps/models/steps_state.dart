import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:redfire/types.dart';

import 'step_model.dart';

part 'steps_state.freezed.dart';
part 'steps_state.g.dart';

@freezed
class StepsState with _$StepsState, ReduxState {
  static const String className = 'StepsState';

  const StepsState._();
  const factory StepsState(
      {StepModel? selected, required ISet<StepModel> all}) = _StepsState;

  factory StepsState.fromJson(JsonMap json) => _$StepsStateFromJson(json);

  factory StepsState.init() => StepsState(all: ISet());

  @override
  String get typeName => className;
}
