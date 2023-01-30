import 'dart:ffi';
import 'dart:typed_data';

import 'package:ffi/ffi.dart';

import '../flutter_tflite_ffi.dart';
import 'bindings_global.dart';
import 'exceptions/t_f_lite_status_exception.dart';
import 'flutter_tflite_ffi_bindings_generated.dart';
import 'extensions.dart';

typedef TensorStruct = TfLiteTensor;

abstract class Interpreter {
  /// The total number of input tensors. 0 if the interpreter creation failed.
  int get inputTensorCount;

  /// The total number of output tensors. 0 if the interpreter creation failed.
  int get outputTensorCount;

  /// Updates allocations for all tensors, resizing dependent tensors using the
  /// specified input tensor dimensionality.
  ///
  /// This is a relatively expensive operation, and need only be called after
  /// creating the graph and/or resizing any inputs.
  void allocateTensors();

  TensorInfo inputTensorInfo({int? index});
  TensorInfo outputTensorInfo({int? index});

  populateInputTensor({required Uint8List data, int? index});

  Uint8List copyOutputTensorData({int? index});

  /// Invokes the interpreter to run inference. May throw [TFLiteStatusException]
  /// if the underlying C function returned an error code.
  void invoke();

  void delete();
}

class InterpreterOptions {
  InterpreterOptions({this.numThreads = 1});

  int numThreads;
}

class NativeInterpreter implements Interpreter {
  NativeInterpreter(String modelPath, {int? numThreads}) {
    final pathPtr = modelPath.toCString();
    _modelPtr = bindingsGlobal.TfLiteModelCreateFromFile(pathPtr);
    malloc.free(pathPtr);

    /// Setup the options used when creating the Interpreter
    Pointer<TfLiteInterpreterOptions> optionsPtr =
        bindingsGlobal.TfLiteInterpreterOptionsCreate();
    bindingsGlobal.TfLiteInterpreterOptionsSetNumThreads(
        optionsPtr, numThreads ?? 1);

    // Create the interpreter
    _ptr = bindingsGlobal.TfLiteInterpreterCreate(_modelPtr, optionsPtr);

    // Delete the options as they are no longer needed
    bindingsGlobal.TfLiteInterpreterOptionsDelete(optionsPtr);
  }

  late Pointer<TfLiteInterpreter> _ptr;
  late Pointer<TfLiteModel> _modelPtr;

  @override
  int get inputTensorCount =>
      bindingsGlobal.TfLiteInterpreterGetInputTensorCount(_ptr);
  @override
  int get outputTensorCount =>
      bindingsGlobal.TfLiteInterpreterGetOutputTensorCount(_ptr);

  @override
  void invoke() {
    int result = bindingsGlobal.TfLiteInterpreterInvoke(_ptr);
    if (result != TfLiteStatus.kTfLiteOk) {
      throw TFLiteStatusException(code: result);
    }
  }

  @override
  void allocateTensors() {
    int result = bindingsGlobal.TfLiteInterpreterAllocateTensors(_ptr);
    if (result != TfLiteStatus.kTfLiteOk) {
      throw TFLiteStatusException(code: result);
    }
  }

  /// Returns the tensor associated with the input index.
  @override
  TensorInfo inputTensorInfo({int? index}) =>
      bindingsGlobal.TfLiteInterpreterGetInputTensor(_ptr, index ?? 0).toInfo();

  /// Returns the tensor associated with the output index.
  ///
  /// The shape and underlying data buffer for output tensors may be not be
  /// available until after the output tensor has been both sized and allocated.
  /// In general, best practice is to interact with the output tensor after
  /// calling [invoke()].
  @override
  TensorInfo outputTensorInfo({int? index}) =>
      bindingsGlobal.TfLiteInterpreterGetOutputTensor(_ptr, index ?? 0)
          .toInfo();

  @override
  void delete() {
    bindingsGlobal.TfLiteModelDelete(_modelPtr);
    bindingsGlobal.TfLiteInterpreterDelete(_ptr);
  }

  /// The TfLiteTensorCopyFromBuffer function calls the following C++:
  ///
  /// if (tensor->bytes != input_data_size) {
  ///   return kTfLiteError;
  /// }
  /// memcpy(tensor->data.raw, input_data, input_data_size);
  /// return kTfLiteOk;
  ///
  /// So rather than allocating C memory, copying into it, then calling
  /// TfLiteTensorCopyFromBuffer (which does another memcpy) we copy straight
  /// into the tensor.
  ///
  /// We might be able to improve on this further when TypedData unwrapping is done (#44589)
  @override
  populateInputTensor({required Uint8List data, int? index}) {
    final inputTensorStruct =
        bindingsGlobal.TfLiteInterpreterGetInputTensor(_ptr, index ?? 0);

    if (inputTensorStruct.ref.bytes != data.length) {
      throw TFLiteStatusException(code: TfLiteStatus.kTfLiteError);
    }

    Pointer<Uint8> buf = inputTensorStruct.ref.data.raw.cast<Uint8>();
    for (var i = 0; i < data.length; i++) {
      buf.elementAt(i).value = data[i];
    }
  }

  // Copies to the provided output buffer from the tensor's buffer.
  // TODO: we are doing an unnecessary copy here, we could avoid that by keepin
  //  a buffer of C memory and return a Uint8List view on the buffer but not
  //  sure if the extra complexity is warranted especially when outputs are
  //  probably often not much data.
  @override
  Uint8List copyOutputTensorData({int? index}) {
    Pointer<TfLiteTensor> outputTensor =
        bindingsGlobal.TfLiteInterpreterGetOutputTensor(_ptr, index ?? 0);

    final outputBytes = outputTensor.ref.bytes;

    Pointer<Void> buffer = malloc(outputBytes);

    int result = bindingsGlobal.TfLiteTensorCopyToBuffer(
        outputTensor, buffer, outputBytes);
    if (result != TfLiteStatus.kTfLiteOk) {
      throw TFLiteStatusException(code: result);
    }

    final outputData = Uint8List(outputBytes);
    final Pointer<Uint8> castBuffer = buffer.cast<Uint8>();
    for (var i = 0; i < outputBytes; i++) {
      outputData[i] = castBuffer[i];
    }

    calloc.free(buffer);

    return outputData;
  }
}
