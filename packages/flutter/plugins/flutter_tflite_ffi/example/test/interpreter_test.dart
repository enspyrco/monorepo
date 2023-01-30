import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_tflite_ffi/flutter_tflite_ffi.dart' as tflite;

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  testWidgets('Should ...', (WidgetTester tester) async {
    final interpreter =
        tflite.createInterpreter(pathToModel: 'assets/model_metadata.tflite');

    print('${interpreter.inputTensorCount} input tensor');
    print('${interpreter.inputTensorInfo()}');

    print('${interpreter.outputTensorCount} output tensor');
  });
}

/// Testing with mock assets
/// see: https://api.flutter.dev/flutter/widgets/DefaultAssetBundle-class.html

// // Create a separate class
// class TestAssetBundle extends CachingAssetBundle {
//   @override
//   Future<ByteData> load(String key) async {
//     if (key == 'resources/test') {
//       return ByteData.view(
//           Uint8List.fromList(utf8.encode('Hello World!')).buffer);
//     }
//     return ByteData(0);
//   }
// }

// // Add this in a widget test 
// await tester.pumpWidget(
//       MaterialApp(
//         home: DefaultAssetBundle(
//           bundle: TestAssetBundle(),
//           child: const TestWidget(),
//         ),
//       ),
//     );


