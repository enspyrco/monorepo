import 'dart:async';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class SaveChildWidget extends StatefulWidget {
  const SaveChildWidget(
      {required String font,
      required Widget child,
      required Completer<Uint8List> completer,
      Key? key})
      : _font = font,
        _child = child,
        _completer = completer,
        super(key: key);
  final String _font;
  final Completer<Uint8List> _completer;
  final Widget _child;

  @override
  _SaveChildWidgetState createState() => _SaveChildWidgetState();
}

class _SaveChildWidgetState extends State<SaveChildWidget> {
  GlobalKey globalKey = GlobalKey();

  Future<void> _capturePng() async {
    final RenderRepaintBoundary boundary =
        globalKey.currentContext!.findRenderObject()! as RenderRepaintBoundary;
    print('paint phase complete, boundary: ${boundary.size}');
    final ui.Image image = await boundary.toImage();
    print('boundary.toImage() gives: ${image.width} x ${image.height} pixels');
    final ByteData? byteData =
        await image.toByteData(format: ui.ImageByteFormat.png);
    print('image.toByteData() gave: ${byteData?.lengthInBytes} bytes');
    final Uint8List pngBytes = byteData!.buffer.asUint8List();

    widget._completer.complete(pngBytes);
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((_) => _capturePng());
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(fontFamily: widget._font),
        home: Scaffold(
            body: RepaintBoundary(
          key: globalKey,
          child: widget._child,
        )));
  }
}
