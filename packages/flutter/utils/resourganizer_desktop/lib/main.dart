import 'dart:io';

import 'package:cross_file/cross_file.dart';
import 'package:desktop_drop/desktop_drop.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        home: MaterialApp(
            home: Scaffold(
      body: ExampleDragTarget(),
    )));
  }
}

class ExampleDragTarget extends StatefulWidget {
  const ExampleDragTarget({super.key});

  @override
  State<ExampleDragTarget> createState() => _ExampleDragTargetState();
}

class _ExampleDragTargetState extends State<ExampleDragTarget> {
  final List<XFile> _files = [];

  bool _dragging = false;

  @override
  Widget build(BuildContext context) {
    return DropTarget(
      onDragDone: (details) {
        setState(() {
          for (final file in details.files) {
            debugPrint("uri: ${file.path} "
                "${File(file.path).existsSync()}");
          }
          _files.addAll(details.files);
        });
      },
      onDragEntered: (details) {
        if (!mounted) return;

        setState(() {
          _dragging = true;
        });
      },
      onDragExited: (details) {
        if (!mounted) return;

        setState(() {
          _dragging = false;
        });
      },
      child: Container(
        height: 200,
        width: 200,
        color: _dragging ? Colors.blue.withOpacity(0.4) : Colors.black26,
        child: _files.isEmpty
            ? const Center(child: Text("Drop here"))
            : Text(_files.map((f) => f.name).join("\n")),
      ),
    );
  }
}
