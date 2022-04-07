import 'package:flutter/material.dart';
import 'package:flutter_box2d_example/game_widget.dart';
import 'package:flutter_box2d_example/game_world.dart';

void main() {
  // WidgetsFlutterBinding.ensureInitialized();

  var gameWorld = GameWorld();

  runApp(MyApp(gameWorld));
}

class MyApp extends StatefulWidget {
  const MyApp(this.gameWorld, {Key? key}) : super(key: key);

  final GameWorld gameWorld;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(title: const Text('Box2Plugin Example')),
          body: GameWidget(widget.gameWorld)),
    );
  }
}
