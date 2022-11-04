import 'package:astro_types/json_types.dart';
import 'package:astro_types/state_types.dart';

import 'step_model.dart';

class StepsState implements AstroState {
  StepsState({this.selected, required this.all});

  final StepModel? selected;
  final Set<StepModel> all;

  factory StepsState.fromJson(JsonMap json) => StepsState(
          selected: StepModel.fromJson(json['selected'] as JsonMap),
          all: {
            ...(json['all'] as List)
                .map((e) => StepModel.fromJson(e as JsonMap))
          });

  static StepsState get initial => StepsState(all: <StepModel>{});

  @override
  StepsState copyWith({
    StepModel? selected,
    Set<StepModel>? all,
  }) =>
      StepsState(all: all ?? this.all, selected: selected ?? this.selected);

  @override
  JsonMap toJson() => {
        'selected': selected?.toJson(),
        'all': [...all.map((e) => e.toJson())],
      };
}
