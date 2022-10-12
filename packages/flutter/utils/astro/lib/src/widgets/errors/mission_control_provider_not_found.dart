import 'package:astro_types/state_types.dart';

class MissionControlProviderNotFound<S extends AstroState> extends Error {
  MissionControlProviderNotFound();

  @override
  String toString() {
    return '''Error: No MissionControlProvider<$S> found. Try:
          
  * Move the MissionControlProvider<$S> higher in the widget tree, above
    where it is first used (eg. by a context.launch call)
  * Provide full type information to MissionControl<$S>, MissionControlProvider<$S>
    and OnStateChangeBuilder<$S, VM>
  * Move the MissionControlProvider<$S> above MaterialApp if the Navigator
    may be changing the widget tree, taking out the MissionControlProvider<$S>
''';
  }
}
