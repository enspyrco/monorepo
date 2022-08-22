import 'package:redaux/redaux.dart';

class StoreProviderNotFoundError<S extends State> extends Error {
  StoreProviderNotFoundError();

  @override
  String toString() {
    return '''Error: No StoreProvider<$S> found. Try:
          
  * Put StoreProvider<$S> above MaterialApp
  * Provide full type information to Store<$S>, StoreProvider<$S>
    and StoreConnector<$S, VM>
''';
  }
}
