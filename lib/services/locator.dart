import 'package:web_socket_game_server/services/connections_service.dart';
import 'package:web_socket_game_server/services/firestore_service.dart';

/// Services are nullable so that we can provide a service if none exists.
///
/// All get_Service functions return non-nullable types so ensuring the
/// services are non-null when they are accessed is up to the developer.
class Locator {
  static FirestoreService getFirestoreService() => _firestoreService!;
  static ConnectionsService getConnectionsService() => _connectionsService!;

  static void provide(
      {FirestoreService? firestoreService,
      ConnectionsService? connectionsService}) {
    _firestoreService = firestoreService;
    _connectionsService = connectionsService;
  }

  static bool get hasFirestoreService => _firestoreService != null;
  static bool get hasNoFirestoreService => _firestoreService == null;
  static bool get hasConnectionsService => _connectionsService != null;
  static bool get hasNoConnectionsService => _connectionsService == null;

  static FirestoreService? _firestoreService;
  static ConnectionsService? _connectionsService;
}
