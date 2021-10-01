// Mocks generated by Mockito 5.0.16 from annotations
// in ws_game_server/test/test-doubles/test_doubles.dart.
// Do not manually edit this file.

import 'package:mockito/mockito.dart' as _i1;
import 'package:web_socket_channel/web_socket_channel.dart' as _i3;
import 'package:ws_game_server/services/client_connections_service.dart' as _i2;

// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types

/// A class which mocks [ClientConnectionsService].
///
/// See the documentation for Mockito's code generation for more information.
class MockClientConnectionsService extends _i1.Mock
    implements _i2.ClientConnectionsService {
  MockClientConnectionsService() {
    _i1.throwOnMissingStub(this);
  }

  @override
  Map<_i3.WebSocketChannel, String> get presenceMap =>
      (super.noSuchMethod(Invocation.getter(#presenceMap),
              returnValue: <_i3.WebSocketChannel, String>{})
          as Map<_i3.WebSocketChannel, String>);
  @override
  dynamic Function(_i3.WebSocketChannel) get messageHandler =>
      (super.noSuchMethod(Invocation.getter(#messageHandler),
              returnValue: (_i3.WebSocketChannel __p0) => null)
          as dynamic Function(_i3.WebSocketChannel));
  @override
  void defaultMessageHandler(_i3.WebSocketChannel? webSocket) =>
      super.noSuchMethod(Invocation.method(#defaultMessageHandler, [webSocket]),
          returnValueForMissingStub: null);
  @override
  String toString() => super.toString();
}
