import 'dart:ffi';

import 'package:ffi_utils/string_extensions.dart';

import 'bindings/flutter_tflite_ffi_bindings_generated.dart';

/// The TfLiteTensor C struct is fully described in a comment at the end of this file

/// We use an extension to avoid coupling TensorInfo to it's native source,
/// which has FFI type Pointer<TfLiteTensor>
extension TfLiteTensorPointerExt on Pointer<TfLiteTensor> {
  toInfo() {
    // The TfLiteTensor is an Opaque pointer b/c flexible C arrays are currently
    // not supported by ffigen. So we get our hands dirty with the pointer.
    final shape = <int>[];
    Pointer<Int> dimsIntPtr = ref.dims.cast<Int>();
    int dimsSize = dimsIntPtr.value;
    for (int i = 0; i < dimsSize; i++) {
      var dim = dimsIntPtr[i + 1];
      shape.insert(i, dim);
    }

    return TensorInfo(
      bytes: ref.bytes,
      dataTypeCode: ref.type,
      isVariable: ref.is_variable,
      name: ref.name.toDartString(),
      shape: shape,
    );
  }
}

/// The TfLiteTensor C struct says:
/// A tensor in the interpreter system which is a wrapper around a buffer of
/// data including a dimensionality (or NULL if not currently defined).
class TensorInfo {
  TensorInfo({
    required this.dataTypeCode,
    required this.bytes,
    required this.name,
    required this.isVariable,
    required this.shape,
  })  : dataTypeName = _tfLiteTypeOf[dataTypeCode]!,
        dataTypeSizeInBytes =
            bytes ~/ shape.reduce((total, element) => total * element);

  /// The data type specification for the data stored in the tensor.
  /// The data type is stored as enum/int in TFLite (known as [dataTypeCode] here).
  final int dataTypeCode;
  late final String dataTypeName;
  late final int dataTypeSizeInBytes;

  // The number of bytes required to store the data of this Tensor. I.e.
  // (bytes of each element) * dims[0] * ... * dims[n-1].  For example, if
  // type is kTfLiteFloat32 and dims = {3, 2} then
  // bytes = sizeof(float) * 3 * 2 = 4 * 3 * 2 = 24.
  final int bytes;

  // Null-terminated name of this tensor.
  final String name;

  // True if the tensor is a variable.
  final bool isVariable;

  /// The expected dimensionality of the tensor's data. The product of
  /// [shape] and the datatype size should equal [bytes].
  final List<int> shape;

  @override
  String toString() {
    final numItems = bytes ~/ dataTypeSizeInBytes;
    return '<<$name>>\n'
        '  - type: $dataTypeName\n'
        '  - shape: $shape\n'
        '  - size: ${shape.fold('', (shapeString, s) => shapeString.isEmpty ? '$s' : '$shapeString x $s')} = '
        '$numItems ${dataTypeName}s = $numItems x $dataTypeSizeInBytes = $bytes bytes\n'
        '  - isVariable: $isVariable\n';
  }
}

/// See note in flutter_tflite_ffi.dart for why we have this map
const Map<int, String> _tfLiteTypeOf = {
  TfLiteType.kTfLiteNoType: 'NoType',
  TfLiteType.kTfLiteFloat32: 'Float32',
  TfLiteType.kTfLiteInt32: 'Int32',
  TfLiteType.kTfLiteUInt8: 'UInt8',
  TfLiteType.kTfLiteInt64: 'Int64',
  TfLiteType.kTfLiteString: 'String',
  TfLiteType.kTfLiteBool: 'Bool',
  TfLiteType.kTfLiteInt16: 'Int16',
  TfLiteType.kTfLiteComplex64: 'Complex64',
  TfLiteType.kTfLiteInt8: 'Int8',
  TfLiteType.kTfLiteFloat16: 'Float16',
  TfLiteType.kTfLiteFloat64: 'Float64',
  TfLiteType.kTfLiteComplex128: 'Complex128',
  TfLiteType.kTfLiteUInt64: 'UInt64',
  TfLiteType.kTfLiteResource: 'Resource',
  TfLiteType.kTfLiteVariant: 'Variant',
  TfLiteType.kTfLiteUInt32: 'UInt32',
  TfLiteType.kTfLiteUInt16: 'UInt16',
  TfLiteType.kTfLiteInt4: 'Int4',
};

/// The tensor struct from common.h is below:

// // A tensor in the interpreter system which is a wrapper around a buffer of
// // data including a dimensionality (or NULL if not currently defined).
// typedef struct TfLiteTensor {
//   // The data type specification for data stored in `data`. This affects
//   // what member of `data` union should be used.
//   TfLiteType type;
//   // A union of data pointers. The appropriate type should be used for a typed
//   // tensor based on `type`.
//   TfLitePtrUnion data;
//   // A pointer to a structure representing the dimensionality interpretation
//   // that the buffer should have. NOTE: the product of elements of `dims`
//   // and the element datatype size should be equal to `bytes` below.
//   TfLiteIntArray* dims;
//   // Quantization information.
//   TfLiteQuantizationParams params;
//   // How memory is mapped
//   //  kTfLiteMmapRo: Memory mapped read only.
//   //  i.e. weights
//   //  kTfLiteArenaRw: Arena allocated read write memory
//   //  (i.e. temporaries, outputs).
//   TfLiteAllocationType allocation_type;
//   // The number of bytes required to store the data of this Tensor. I.e.
//   // (bytes of each element) * dims[0] * ... * dims[n-1].  For example, if
//   // type is kTfLiteFloat32 and dims = {3, 2} then
//   // bytes = sizeof(float) * 3 * 2 = 4 * 3 * 2 = 24.
//   size_t bytes;

//   // An opaque pointer to a tflite::MMapAllocation
//   const void* allocation;

//   // Null-terminated name of this tensor.
//   const char* name;

//   // The delegate which knows how to handle `buffer_handle`.
//   // WARNING: This is an experimental interface that is subject to change.
//   struct TfLiteDelegate* delegate;

//   // An integer buffer handle that can be handled by `delegate`.
//   // The value is valid only when delegate is not null.
//   // WARNING: This is an experimental interface that is subject to change.
//   TfLiteBufferHandle buffer_handle;

//   // If the delegate uses its own buffer (e.g. GPU memory), the delegate is
//   // responsible to set data_is_stale to true.
//   // `delegate->CopyFromBufferHandle` can be called to copy the data from
//   // delegate buffer.
//   // WARNING: This is an // experimental interface that is subject to change.
//   bool data_is_stale;

//   // True if the tensor is a variable.
//   bool is_variable;

//   // Quantization information. Replaces params field above.
//   TfLiteQuantization quantization;

//   // Parameters used to encode a sparse tensor.
//   // This is optional. The field is NULL if a tensor is dense.
//   // WARNING: This is an experimental interface that is subject to change.
//   TfLiteSparsity* sparsity;

//   // Optional. Encodes shapes with unknown dimensions with -1. This field is
//   // only populated when unknown dimensions exist in a read-write tensor (i.e.
//   // an input or output tensor). (e.g.  `dims` contains [1, 1, 1, 3] and
//   // `dims_signature` contains [1, -1, -1, 3]).  If no unknown dimensions exist
//   // then `dims_signature` is either null, or set to an empty array.  Note that
//   // this field only exists when TF_LITE_STATIC_MEMORY is not defined.
//   const TfLiteIntArray* dims_signature;
// }
