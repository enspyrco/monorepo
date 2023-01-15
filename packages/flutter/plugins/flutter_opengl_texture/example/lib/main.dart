import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_opengl_texture/flutter_opengl_texture.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _controller = FlutterOpenglTexture();
  final _width = 200.0;
  final _height = 200.0;

  @override
  initState() {
    super.initState();

    initializeController();
  }

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('OpenGL via Texture widget example'),
        ),
        body: Center(
          child: SizedBox(
            width: _width,
            height: _height,
            child: _controller.isInitialized
                ? Texture(textureId: _controller.textureId!)
                : null,
          ),
        ),
      ),
    );
  }

  Future<void> initializeController() async {
    await _controller.initialize(_width, _height);
    setState(() {});
  }
}
