import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image/image.dart' as img_pkg;

import 'drop_notifier.dart';
import 'drop_target.dart';

void main() => runApp(const HomePage());

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: DropNotifier(
          child: StreamBuilder<List<File>>(
            stream: DropTarget.instance.dropped,
            initialData: const [],
            builder: (context, snapshot) {
              return Row(children: [
                ...snapshot.data!.map((file) {
                  final thumb = img_pkg.copyResize(
                      img_pkg.decodeImage(file.readAsBytesSync())!,
                      height: 120);
                  String newName = file.path + '_thumb.png';
                  print('saving as $newName');
                  final thumbFile = File(newName)
                    ..writeAsBytesSync(img_pkg.encodePng(thumb));
                  return Image.file(thumbFile);
                }) // Image.file(file)
              ]);
            },
          ),
        ),
      ),
    );
  }
}
