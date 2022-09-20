import 'package:astro/astro.dart';

class StoreProviderNotFoundError<S extends State> extends Error {
  StoreProviderNotFoundError();

  @override
  String toString() {
    return '''Error: No StoreProvider<$S> found. Try:
          
  * Move the StoreProvider<$S> higher in the widget tree, above
    where it is first used (eg. by a context.dispatch call)
  * Provide full type information to Store<$S>, StoreProvider<$S>
    and StateStreamBuilder<$S, VM>
  * Move the StoreProvider<$S> above MaterialApp if the Navigator
    may be changing the widget tree, taking out the StoreProvider<$S>
''';
  }
}
