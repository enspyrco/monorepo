import 'dart:ffi';

import 'package:flutter_tflite_ffi/src/extensions.dart';

import 'bindings.dart';
import 'exceptions/t_f_lite_status_exception.dart';
import 'flutter_tflite_ffi_bindings_generated.dart';

abstract class Interpreter {
  int get inputTensorCount;
  int get outputTensorCount;
  List<String> get signatureKeys;

  /// May throw a [TFLiteStatusException], indicating there is a configuration
  /// issue that needs to be resolved by the plugin user.
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

  /// May throw a [TFLiteStatusException], indicating there is a configuration
  /// issue that needs to be resolved by the plugin user.
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
