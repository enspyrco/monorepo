import 'dart:async';
import 'dart:isolate';

import 'package:flutter_box2c/src/bindings/global_bindings.dart';

import 'interfaces.dart' as b2;
import 'src/bindings/generated_bindings.dart';
import 'src/b2.dart' as b2;

String version() {
  b2Version version = globalBindings.b2_version;
  return '${version.major}.${version.major}.${version.revision}';
}

/// First step - adapt code from box2c/test_world.c
/// https://github.com/erincatto/box2c/blob/main/test/test_world.c
void fun() {
  // Construct a world object, which will hold and simulate the rigid bodies.
  b2.World world = b2.FFIWorld(gravityX: 0.0, gravityY: -10.0);

  // Create the ground body.
  b2.Body groundBody = world.createBody(xPosition: 0.0, yPosition: -10.0);

  // // Define the ground box shape. The extents are the half-widths of the box.
  // b2Polygon groundBox = b2MakeBox(50.0f, 10.0f);

  // // Add the box shape to the ground body.
  // b2ShapeDef groundShapeDef = b2DefaultShapeDef();
  // b2Body_CreatePolygon(groundBodyId, &groundShapeDef, &groundBox);

  // // Define the dynamic body. We set its position and call the body factory.
  // b2BodyDef bodyDef = b2DefaultBodyDef();
  // bodyDef.type = b2_dynamicBody;
  // bodyDef.position = (b2Vec2){0.0f, 4.0f};
  // b2BodyId bodyId = b2World_CreateBody(worldId, &bodyDef);

  // // Define another box shape for our dynamic body.
  // b2Polygon dynamicBox = b2MakeBox(1.0f, 1.0f);

  // // Define the dynamic body fixture.
  // b2ShapeDef shapeDef = b2DefaultShapeDef();

  // // Set the box density to be non-zero, so it will be dynamic.
  // shapeDef.density = 1.0f;

  // // Override the default friction.
  // shapeDef.friction = 0.3f;

  // // Add the shape to the body.
  // b2Body_CreatePolygon(bodyId, &shapeDef, &dynamicBox);

  // // Prepare for simulation. Typically we use a time step of 1/60 of a
  // // second (60Hz) and 10 iterations. This provides a high quality simulation
  // // in most game scenarios.
  // float timeStep = 1.0f / 60.0f;
  // int32_t velocityIterations = 6;
  // int32_t positionIterations = 2;

  // b2Vec2 position = b2Body_GetPosition(bodyId);
  // float angle = b2Body_GetAngle(bodyId);

  // // This is our little game loop.
  // for (int32_t i = 0; i < 60; ++i)
  // {
  // 	// Instruct the world to perform a single step of simulation.
  // 	// It is generally best to keep the time step and iterations fixed.
  // 	b2World_Step(worldId, timeStep, velocityIterations, positionIterations);

  // 	// Now print the position and angle of the body.
  // 	position = b2Body_GetPosition(bodyId);
  // 	angle = b2Body_GetAngle(bodyId);

  // 	//printf("%4.2f %4.2f %4.2f\n", position.x, position.y, angle);
  // }

  // // When the world destructor is called, all bodies and joints are freed. This can
  // // create orphaned ids, so be careful about your world management.
  // b2DestroyWorld(worldId);

  // ENSURE(B2_ABS(position.x) < 0.01f);
  // ENSURE(B2_ABS(position.y - 1.01f) < 0.01f);
  // ENSURE(B2_ABS(angle) < 0.01f);
}

/// A very short-lived native function.
///
/// For very short-lived functions, it is fine to call them on the main isolate.
/// They will block the Dart execution while running the native function, so
/// only do this for native functions which are guaranteed to be short-lived.
// int sum(int a, int b) => _bindings.sum(a, b);

/// A longer lived native function, which occupies the thread calling it.
///
/// Do not call these kind of native functions in the main isolate. They will
/// block Dart execution. This will cause dropped frames in Flutter applications.
/// Instead, call these native functions on a separate isolate.
///
/// Modify this to suit your own use case. Example use cases:
///
/// 1. Reuse a single isolate for various different kinds of requests.
/// 2. Use multiple helper isolates for parallel execution.
Future<int> sumAsync(int a, int b) async {
  final SendPort helperIsolateSendPort = await _helperIsolateSendPort;
  final int requestId = _nextSumRequestId++;
  final _SumRequest request = _SumRequest(requestId, a, b);
  final Completer<int> completer = Completer<int>();
  _sumRequests[requestId] = completer;
  helperIsolateSendPort.send(request);
  return completer.future;
}

/// A request to compute `sum`.
///
/// Typically sent from one isolate to another.
class _SumRequest {
  final int id;
  final int a;
  final int b;

  const _SumRequest(this.id, this.a, this.b);
}

/// A response with the result of `sum`.
///
/// Typically sent from one isolate to another.
class _SumResponse {
  final int id;
  final int result;

  const _SumResponse(this.id, this.result);
}

/// Counter to identify [_SumRequest]s and [_SumResponse]s.
int _nextSumRequestId = 0;

/// Mapping from [_SumRequest] `id`s to the completers corresponding to the correct future of the pending request.
final Map<int, Completer<int>> _sumRequests = <int, Completer<int>>{};

/// The SendPort belonging to the helper isolate.
Future<SendPort> _helperIsolateSendPort = () async {
  // The helper isolate is going to send us back a SendPort, which we want to
  // wait for.
  final Completer<SendPort> completer = Completer<SendPort>();

  // Receive port on the main isolate to receive messages from the helper.
  // We receive two types of messages:
  // 1. A port to send messages on.
  // 2. Responses to requests we sent.
  final ReceivePort receivePort = ReceivePort()
    ..listen((dynamic data) {
      if (data is SendPort) {
        // The helper isolate sent us the port on which we can sent it requests.
        completer.complete(data);
        return;
      }
      if (data is _SumResponse) {
        // The helper isolate sent us a response to a request we sent.
        final Completer<int> completer = _sumRequests[data.id]!;
        _sumRequests.remove(data.id);
        completer.complete(data.result);
        return;
      }
      throw UnsupportedError('Unsupported message type: ${data.runtimeType}');
    });

  // Start the helper isolate.
  await Isolate.spawn((SendPort sendPort) async {
    final ReceivePort helperReceivePort = ReceivePort()
      ..listen((dynamic data) {
        // On the helper isolate listen to requests and respond to them.
        if (data is _SumRequest) {
          // final int result = _bindings.sum_long_running(data.a, data.b);
          // final _SumResponse response = _SumResponse(data.id, result);
          // sendPort.send(response);
          return;
        }
        throw UnsupportedError('Unsupported message type: ${data.runtimeType}');
      });

    // Send the the port to the main isolate on which we can receive requests.
    sendPort.send(helperReceivePort.sendPort);
  }, receivePort.sendPort);

  // Wait until the helper isolate has sent us back the SendPort on which we
  // can start sending requests.
  return completer.future;
}();
