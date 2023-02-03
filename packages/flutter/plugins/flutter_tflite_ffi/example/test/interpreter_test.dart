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

    final tensorImage = await tflite.TensorImage.loadFromFile(
        path: 'test/input_image.jpeg',
        inputFormat: tflite.ImageFormat.rgba8888,
        targetWidth: 256,
        targetHeight: 256);

    interpreter.setInputTensorData(tensorImage);

    interpreter.invoke();

    List<double> outputData = interpreter.getOutputTensorData<double>();

    print('Output:');
    for (int i = 0; i < 17; i++) {
      var offset = i * 3;
      Keypoint(
          outputData[offset + 1], outputData[offset], outputData[offset + 2]);
      print(
          'x: ${outputData[offset + 1]}, y: ${outputData[offset]}, s: ${outputData[offset + 2]}');
    }
  });
}
