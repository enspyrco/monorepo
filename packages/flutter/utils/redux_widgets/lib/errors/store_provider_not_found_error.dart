import 'package:enspyr_redux/redux.dart';

class StoreProviderNotFoundError<S extends ReduxState> extends Error {
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
