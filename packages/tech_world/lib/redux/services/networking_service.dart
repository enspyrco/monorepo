import 'dart:async';
import 'dart:convert';

import 'package:redfire/types.dart' hide JsonMap;
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:ws_game_server_types/ws_game_server_types.dart';

import '../../shared/constants.dart' as constants;
import '../actions/set_other_player_ids_action.dart';
import '../actions/set_player_path_action.dart';

const _uriString = constants.usCentral1;

/// The core of th [NetworkingService] is a websocket connected to a CloudRun
/// instance.
///
/// Incoming events are [_identify]'d, converted to actions and pushed into the
/// stream controlled by [_actionsStreamController].  A middleware ensures the
/// actions are dispatched to the [Store].
class NetworkingService {
  /// The userId is set in [connect]
  String? _userId;
  int _departureTime = 0;
  WebSocketChannel? _webSocket;
  StreamSubscription? _serverSubscription;

  late Stream<dynamic> _serverStream;
  late Sink<dynamic> _serverSink;

  /// Controls the stream that is used
  final StreamController<ReduxAction> _actionsStreamController =
      StreamController<ReduxAction>.broadcast();

  Stream<ReduxAction> get actionsStream => _actionsStreamController.stream;

  // Create a websocket connected to the server and attach callbacks.
  void connect(String uid) {
    _userId = uid;
    print('$_userId connecting to $_uriString');
    _webSocket = WebSocketChannel.connect(Uri.parse(_uriString));
    _serverStream = _webSocket!.stream;
    _serverSink = _webSocket!.sink;

    // Listen to the websocket, identify events & add actions to a stream
    _serverSubscription = _serverStream.listen(
      (dynamic data) => _actionsStreamController
          .add(_identify(jsonDecode(data as String) as JsonMap)),
      onError: (dynamic err) =>
          print('${DateTime.now()} > CONNECTION ERROR: $err'),
      onDone: () =>
          '${DateTime.now()} > CONNECTION DONE! closeCode=${_webSocket?.closeCode}, closeReason= ${_webSocket?.closeReason}',
    );

    _announce();
  }

  // Announce our presence.
  void _announce() =>
      _serverSink.add(jsonEncode(PresentMessage(_userId!).toJson()));

  void publish(ServerMessage message) {
    // record time and send data via websocket
    _departureTime = DateTime.now().millisecondsSinceEpoch;
    final jsonString = jsonEncode(message.toJson());
    _serverSink.add(jsonString);
  }

  ReduxAction _identify(JsonMap json) {
    print('identifying: $json');
    // Check the type of data in the event and respond appropriately.
    if (json['type'] == 'other_player_ids') {
      final otherPlayers = OtherPlayerIdsMessage.fromJson(json);
      return SetOtherPlayerIdsAction(otherPlayers.ids);
    } else {
      final message = PlayerPathMessage.fromJson(json);
      if (message.userId == _userId) {
        print('ws: ${DateTime.now().millisecondsSinceEpoch - _departureTime}');
      }
      return SetPlayerPathAction(message);
    }
  }

  Future<void> disconnect() async {
    // await _actionsStreamController.close();
    await _serverSubscription?.cancel();
    if (_webSocket != null) {
      _serverSink.close();
      _webSocket = null;
    }
  }
}
