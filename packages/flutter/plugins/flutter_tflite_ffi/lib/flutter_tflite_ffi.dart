import 'package:ffi/ffi.dart';

import 'src/bindings_global.dart';
import 'src/interpeter.dart';

export 'src/interpeter.dart';
export 'src/tensor_info.dart';

String version() => bindingsGlobal.TfLiteVersion().cast<Utf8>().toDartString();

Interpreter createInterpreter({required String pathToModel, int? numThreads}) =>
    NativeInterpreter(pathToModel, numThreads: numThreads);

/// The enums in the TFLite headers aren't being generated properly
/// I'm still looking into this but it looks like it might be a limitation that
/// will be fixed by ffigen in the future, see: ffigen #236
///
/// There are two problems I'm aware of:
///  - type erasure
///  - class enums without any index -> enum functionality
///
/// For now I'm creating int->string maps but this is fragile as there won't be
/// any way to know if the enums on the C side change. I'll leave this note here
/// as a reminder and when ffigen generates real enums it can be removed.
///
/// The relevant int->string maps are in:
///  - t_f_lite_status_exception.dart
///  - tensor_info.dart