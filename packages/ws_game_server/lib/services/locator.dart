import 'package:ws_game_server/services/client_connections_service.dart';

/// Services are nullable so that we can only provide a service if none exists,
/// allowing for mocks to be set in tests.
///
/// All get_Service functions return non-nullable types. Ensuring the
/// services are not null when they are accessed is up to the developer.
class Locator {
  static ClientConnectionsService getClientConnectionsService() =>
      _clientConnectionsService!;

  // Sets _clientConnectionsService if not already set
  static void provide({ClientConnectionsService? service}) {
    _clientConnectionsService ??= service;
  }

  // Sets _clientConnectionsService to the default, if not already set
  static ClientConnectionsService provideDefaultClientConnectionsService() {
    _clientConnectionsService ??= ClientConnectionsService();
    return _clientConnectionsService!;
  }

  static bool get hasClientConnectionsService =>
      _clientConnectionsService != null;
  static bool get needsClientConnectionsService =>
      _clientConnectionsService == null;

  static ClientConnectionsService? _clientConnectionsService;
}
