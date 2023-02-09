import 'dart:io' as io;

import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';

class ModelExtractor {
  ModelExtractor._(this.path);

  late final String path;

  static Future<ModelExtractor> loadFromAsset({required String key}) async {
    // Extract model from bundle
    ByteData data = await rootBundle.load(key);
    Uint8List bytes =
        data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
    io.Directory directory = await getApplicationDocumentsDirectory();
    final file = io.File('${directory.path}/model.tflite')
      ..writeAsBytesSync(bytes);

    return ModelExtractor._(file.path);
  }
}
