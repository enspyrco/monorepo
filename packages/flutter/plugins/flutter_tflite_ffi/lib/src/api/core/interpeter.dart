import 'dart:ffi';

import 'package:flutter_tflite_ffi/src/extensions.dart';

import '../../bindings.dart';
import '../../exceptions/t_f_lite_status_exception.dart';
import '../../flutter_tflite_ffi_bindings_generated.dart';

abstract class Interpreter {
  /// The total number of input tensors. 0 if the interpreter creation failed.
  int get inputTensorCount;

  /// The total number of output tensors. 0 if the interpreter creation failed.
  int get outputTensorCount;

  /// An ordered list of the SignatureDef exported method names available in the model.
  List<String> get signatureKeys;

  /// Invokes the interpreter to run inference. May throw [TFLiteStatusException]
  /// if the underlying C function returned an error code.
  void invoke();
}

class NativeInterpreter implements Interpreter {
  NativeInterpreter({
    required String modelPath,
    InterpreterOptions options = const InterpreterOptions(),
    List<Delegate> delegates = const [],
  }) {
    Pointer<TfLiteModel> model =
        bindings.TfLiteModelCreateFromFile(modelPath.toCString());

    final nullOptions = Pointer<TfLiteInterpreterOptions>.fromAddress(0);
    _interpreter = bindings.TfLiteInterpreterCreate(model, nullOptions);

    inputTensorCount =
        bindings.TfLiteInterpreterGetInputTensorCount(_interpreter);
    outputTensorCount =
        bindings.TfLiteInterpreterGetOutputTensorCount(_interpreter);
  }

  @override
  late int inputTensorCount;
  @override
  late int outputTensorCount;
  @override
  late List<String> signatureKeys;

  late Pointer<TfLiteInterpreter> _interpreter;

  @override
  void invoke() {
    int result = bindings.TfLiteInterpreterInvoke(_interpreter);
    if (result != TfLiteStatus.kTfLiteOk) {
      throw TFLiteStatusException(code: result);
    }
  }

  // - (nullable TFLTensor *)inputTensorAtIndex:(NSUInteger)index error:(NSError **)error;
  // - (nullable TFLTensor *)outputTensorAtIndex:(NSUInteger)index error:(NSError **)error;
  // - (BOOL)resizeInputTensorAtIndex:(NSUInteger)index
  //                        toShape:(NSArray<NSNumber *> *)shape
  //                          error:(NSError **)error;
  // - (BOOL)allocateTensorsWithError:(NSError **)error;
  // - (nullable TFLSignatureRunner *)signatureRunnerWithKey:(NSString *)key error:(NSError **)error;
}

class InterpreterOptions {
  const InterpreterOptions();
}

class Delegate {}
