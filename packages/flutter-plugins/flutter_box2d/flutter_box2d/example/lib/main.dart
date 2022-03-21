import 'package:flutter/material.dart';
import 'package:flutter_box2d/flutter_box2d.dart';

void main() {
  var gravity = B2Vec2(0, 10);
  var world = B2World(gravity);

  var sideLengthMetres = 1;
  var square = B2PolygonShape();
  square.setAsBox(sideLengthMetres / 2, sideLengthMetres / 2);

  var zero = B2Vec2(0, 0);

  var bd = B2BodyDef();
  bd.setType(B2DynamicBody);
  bd.setPosition(zero);

  var body = world.createBody(bd);
  body.createFixture(square, 1);
  body.setTransform(zero, 0);
  body.setLinearVelocity(zero);
  body.setAwake(true);
  body.setEnabled(true);

  world.step(0.1, 1, 1);
  print('p: ${body.getPosition().x}, ${body.getPosition().y}');
  print('v: ${body.getLinearVelocity().x}, ${body.getLinearVelocity().y}');
  world.step(0.1, 1, 1);
  print('p: ${body.getPosition().x}, ${body.getPosition().y}');
  print('v: ${body.getLinearVelocity().x}, ${body.getLinearVelocity().y}');

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final String _platformVersion = 'Unknown';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Text('Running on: $_platformVersion\n'),
        ),
      ),
    );
  }
}
