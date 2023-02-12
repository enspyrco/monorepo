import 'dart:typed_data';

import 'package:flutter/material.dart';

class SnappedRGBImageView extends StatelessWidget {
  const SnappedRGBImageView(this.notifier, {super.key});

  final ValueNotifier<Uint8List> notifier;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<Uint8List>(
        valueListenable: notifier,
        builder: (context, imageData, child) {
          if (imageData.isEmpty) {
            return Container();
          }
          return Image(image: MemoryImage(imageData));
        });
  }
}
