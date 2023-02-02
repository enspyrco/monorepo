import 'dart:typed_data';
import 'dart:io' as io;
import 'dart:ui' as ui;

import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_tflite_ffi/flutter_tflite_ffi.dart' as tflite;

const int inW = 256;
const int inH = 256;

class Keypoint {
  Keypoint(this.x, this.y, this.s);
  final double x;
  final double y;
  final double s;
}

void main() {
  // TestWidgetsFlutterBinding.ensureInitialized();
  testWidgets('Should ...', (WidgetTester tester) async {
    final interpreter = tflite.createInterpreter(
        pathToModel:
            'assets/lite-model_movenet_multipose_lightning_tflite_float16_1.tflite');

    interpreter.reshapeInputTensor(shape: [1, 256, 256, 3]);
    interpreter.allocateTensors();

    print('${interpreter.inputTensorCount} input tensor');
    print('${interpreter.getInputTensorInfo()}');

    print('${interpreter.outputTensorCount} output tensor');
    print('${interpreter.getOutputTensorInfo()}');

    Uint8List jpegBytes = io.File('test/input_image.jpeg').readAsBytesSync();

    final ui.ImmutableBuffer buffer =
        await ui.ImmutableBuffer.fromUint8List(jpegBytes);
    final ui.ImageDescriptor descriptor =
        await ui.ImageDescriptor.encoded(buffer);
    buffer.dispose();

    final codec = await descriptor.instantiateCodec(
      targetWidth: inW,
      targetHeight: inH,
    );
    ui.FrameInfo frameInfo = await codec.getNextFrame();

    ui.Image image = frameInfo.image;
    print('${frameInfo.image.width} x ${frameInfo.image.height}');

    final rgbaByteData =
        (await image.toByteData(format: ui.ImageByteFormat.rawRgba))!;

    // TODO: avoid axtra copy by using a Uint8List backed by C memory
    //  Actually we can only read C memory that way I guess so no good?
    final rgbBytes = Uint8List(inW * inH * 3);
    for (var i = 0; i < inW * inH; i++) {
      final rgbOffset = i * 3;
      final rgbaOffset = i * 4;
      rgbBytes[rgbOffset] = rgbaByteData.getUint8(rgbaOffset); // red
      rgbBytes[rgbOffset + 1] = rgbaByteData.getUint8(rgbaOffset + 1); // green
      rgbBytes[rgbOffset + 2] = rgbaByteData.getUint8(rgbaOffset + 2); // blue
    }

    interpreter.setInputTensorData(
        data: rgbBytes, format: tflite.ImageFormat.rgb888);

    interpreter.invoke();

    var info = interpreter.getOutputTensorInfo();

    List<double> outputData = interpreter.getOutputTensorData<double>();

    for (int i = 0; i < 17; i++) {
      var offset = i * 3;
      Keypoint(
          outputData[offset + 1], outputData[offset], outputData[offset + 2]);
      print(
          'x: ${outputData[offset + 1]}, y: ${outputData[offset]}, s: ${outputData[offset + 2]}');
    }
  });
}
