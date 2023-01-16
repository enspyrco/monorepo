import 'package:flutter/material.dart';

import 'package:flutter_tflite_ffi/flutter_tflite_ffi.dart'
    as flutter_tflite_ffi;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _version = '?';

  @override
  void initState() {
    super.initState();
    _version = 'TFLite version: ${flutter_tflite_ffi.version()}';
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Native Packages'),
          ),
          body: Text(_version)),
    );
  }
}
