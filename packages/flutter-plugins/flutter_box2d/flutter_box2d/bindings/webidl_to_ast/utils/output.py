# ClassSet holds a list of strings for each of the classes we are constructing for output.
class ClassSet:
  def __init__(self, name):
    class_name = name[0].upper() + name[1:]
    self.glue_c = ['\n// ' + name + '\n']
    self.itf = []
    self.itf_mac = []
    self.itf_web = []
    self.decs = ['class ' + class_name + ' {\n\n\tfinal ' + class_name + 'Platform _delegate;\n']
    self.dels = ['abstract class ' + class_name + 'Platform extends PlatformInterface {\n\n\tstatic final Object _token = Object();\n']
    self.ffi = ['class ' + class_name + 'FfiAdapter implements ' + class_name + 'Platform {\n\n\tfinal Pointer<Void> _self;\n\t' + class_name + 'FfiAdapter._(Pointer<Void> self) : _self = self;\n']
    self.jsadapter = ['class ' + class_name + 'JSAdapter implements ' + class_name + 'Platform {\n']
    self.jsadapter  += ['\n\t'+class_name+'JSAdapter._('+ class_name + 'JSImpl impl) : _impl = impl;\n']
    self.jsadapter  += ['\n\tfinal '+ class_name + 'JSImpl _impl;\n']
    self.jsimpl = ['@JS(\'' + name + '\')\nclass ' + class_name + 'JSImpl {\n']
  
  def addEndings(self):
    self.glue_c += ['\n']
    self.dels += ['\n}\n\n']
    self.decs += ['\n}\n\n']
    self.ffi += ['\n}\n\n']
    self.jsadapter += ['\n}\n\n']
    self.jsimpl += ['\n}\n\n']

# When we finish contstructing the strings for each of the classes to be output, we add them to a variable of type Output
# which is used at the end of the process to write everything out to file.
class Output:
  def __init__(self):
    self.glue_c = []
    self.itf = []
    self.itf_mac = []
    self.itf_web = []
    self.dels = []
    self.decs = []
    self.ffi = []
    self.jsadapter = []
    self.jsimpl = []
    
  def finishThenAdd(self, class_set):
    class_set.addEndings()
    self.glue_c += class_set.glue_c
    self.itf += class_set.itf
    self.itf_mac += class_set.itf_mac
    self.itf_web += class_set.itf_web
    self.dels += class_set.dels
    self.decs += class_set.decs
    self.ffi += class_set.ffi
    self.jsadapter += class_set.jsadapter
    self.jsimpl += class_set.jsimpl
  
  def writeToFiles(self):
    with open('out/glue.c', 'w') as c:
      for x in self.glue_c:
        c.write(x)
    with open('out/flutter_box2d_platform_interface.dart', 'w') as dart:
      dart.write(pre_itf)
      for x in self.itf:
        dart.write(x)
      dart.write('\n}\n')
    with open('out/flutter_box2d_macos.dart', 'w') as dart:
      dart.write(pre_itf_mac)
      for x in self.itf_mac:
        dart.write(x)
      dart.write('\n}\n')
    with open('out/flutter_box2d_web.dart', 'w') as dart:
      dart.write(pre_itf_web)
      for x in self.itf_web:
        dart.write(x)
      dart.write('\n}\n')
    with open('out/b2_decorators.dart', 'w') as dart:
      dart.write(pre_decs)
      for x in self.decs:
        dart.write(x)
    with open('out/b2_delegates.dart', 'w') as dart:
      dart.write(pre_dels)
      for x in self.dels:
        dart.write(x)    
    with open('out/b2_adapters_ffi.dart', 'w') as dart:
      dart.write(pre_ffi)
      for x in self.ffi:
        dart.write(x)
    with open('out/b2_adapters_web.dart', 'w') as dart:
      dart.write(pre_js)
      for x in self.jsadapter:
        dart.write(x)
      for x in self.jsimpl:
        dart.write(x)

pre_itf = r'''import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'b2_delegates.dart';

// export 'src/b2_classes.dart';
// export 'src/b2_constants.dart';
// export 'src/b2_delegates.dart';

/// The interface that implementations of flutter_box2d must implement.
///
/// Platform implementations should extend this class rather than implement it as `flutter_box2d`
/// does not consider newly added methods to be breaking changes. Extending this class
/// (using `extends`) ensures that the subclass will get the default implementation, while
/// platform implementations that `implements` this interface will be broken by newly added
/// [FlutterBox2DPlatform] methods.
///
/// For more details see: https://pub.dev/packages/plugin_platform_interface
abstract class FlutterBox2DPlatform extends PlatformInterface {
  /// Constructs a FlutterBox2DPlatform.
  FlutterBox2DPlatform() : super(token: _token);

  static final Object _token = Object();
  static late FlutterBox2DPlatform _instance;

  static FlutterBox2DPlatform get instance => _instance;

  /// Platform-specific plugins set this with their own platform-specific
  /// class that extends [FlutterBox2DPlatform] when they register themselves.
  static set instance(FlutterBox2DPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }
'''

pre_itf_mac = '''//import 'package:flutter_box2d_platform_interface/flutter_box2d_platform_interface.dart';
import 'b2_adapters_ffi.dart';
import 'b2_delegates.dart';
import 'flutter_box2d_platform_interface.dart';

/// The macos implementation of the FlutterBox2d plugin.
class FlutterBox2DMacos extends FlutterBox2DPlatform {
  // Called by code generated at build-time to setup the appropriate platform implementation.
  static void registerWith() {
    FlutterBox2DPlatform.instance = FlutterBox2DMacos();
  }

  FlutterBox2DMacos();
''';

pre_itf_web = '''//import 'package:flutter_box2d_platform_interface/flutter_box2d_platform_interface.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'b2_adapters_web.dart';
import 'b2_delegates.dart';
import 'flutter_box2d_platform_interface.dart';

/// The web implementation of the FlutterBox2d plugin.
class FlutterBox2DWeb extends FlutterBox2DPlatform {
  // Called by code generated at build-time to setup the appropriate platform implementation.
  static void registerWith(Registrar registrar) {
    FlutterBox2DPlatform.instance = FlutterBox2DWeb();
  }
''';

pre_decs = '''import 'flutter_box2d_platform_interface.dart';
import 'b2_delegates.dart';

'''

pre_dels = '''import 'package:plugin_platform_interface/plugin_platform_interface.dart';

'''

pre_ffi = '''import 'dart:ffi';

// import 'package:flutter_box2d_platform_interface/flutter_box2d_platform_interface.dart';
import 'b2_delegates.dart';

final DynamicLibrary _symbols = DynamicLibrary.process();

typedef EmptyConstructor = Pointer<Void> Function();

'''

pre_js = '''@JS()
library box2d;

import 'package:js/js.dart';

import 'b2_delegates.dart';

'''
