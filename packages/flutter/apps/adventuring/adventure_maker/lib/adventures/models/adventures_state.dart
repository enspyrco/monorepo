import 'package:astro_types/json_types.dart';
import 'package:astro_types/state_types.dart';

import 'adventure_model.dart';

class AdventuresState implements AstroState {
  const AdventuresState({this.selected, required this.all});

  final AdventureModel? selected;
  final Set<AdventureModel> all;

  static AdventuresState get initial => const AdventuresState(all: {});

  @override
  AdventuresState copyWith({
    AdventureModel? selected,
    Set<AdventureModel>? all,
  }) =>
      AdventuresState(
          all: all ?? this.all, selected: selected ?? this.selected);

  @override
  JsonMap toJson() => {
        'selected': selected?.toJson() ?? <String, dynamic>{},
        'all': all.map((e) => e.toJson()).toList(),
      };
}
