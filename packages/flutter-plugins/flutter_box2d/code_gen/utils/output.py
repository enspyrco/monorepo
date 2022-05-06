from utils.utils import upper_first

# ClassSet holds a list of strings for each of the classes we are constructing for output.
class ClassSet:
  def __init__(self, name, interface, maybe_implements):
    class_name = upper_first(name)
    delegate_lines = '\n\tfinal ' + class_name + 'Platform _delegate;\n\n\t'+class_name+'._('+class_name + 'Platform delegate) : _delegate = delegate;\n'
    maybe_implements_dec = '' if maybe_implements == '' else ' implements ' + maybe_implements + ' '
    maybe_implements_del = '' if maybe_implements == '' else ' implements ' + maybe_implements + 'Platform '
    maybe_implements_ffi = '' if maybe_implements == '' else ', ' + maybe_implements + 'FfiAdapter '
    maybe_implements_web_adpr = '' if maybe_implements == '' else ', ' + maybe_implements + 'JSAdapter '
    maybe_implements_web_impl = '' if maybe_implements == '' else ' extends ' + maybe_implements + 'JSImpl '

    self.glue_c = ['\n// ' + name + '\n']
    self.itf = []
    self.itf_mac = []
    self.itf_web = []
    self.decs = ['class ' + class_name + maybe_implements_dec + ' {\n' + delegate_lines]
    self.dels = ['abstract class ' + class_name + 'Platform' + maybe_implements_del + '{\n']
    self.ffi = ['class ' + class_name + 'FfiAdapter implements ' + class_name + 'Platform'+ maybe_implements_ffi + ' {\n\n\tfinal Pointer<Void> _self;\n\t' + class_name + 'FfiAdapter._(Pointer<Void> self) : _self = self;\n']
    self.jsadapter = ['class ' + class_name + 'JSAdapter implements ' + class_name + 'Platform' + maybe_implements_web_adpr + ' {\n']
    self.jsadapter  += ['\n\t'+class_name+'JSAdapter._('+ class_name + 'JSImpl impl) : _impl = impl;\n']
    self.jsadapter  += ['\n\tfinal '+ class_name + 'JSImpl _impl;\n']
    self.jsimpl_intr = ['@JS(\'' + name + '\')\n@staticInterop\nclass ' + class_name + 'JSImpl'+maybe_implements_web_impl+' {\n']
    self.jsimpl_extn = ['extension '+class_name+'JSImplExtension on '+class_name+'JSImpl {\n']
  
  def addEndings(self):
    self.glue_c += ['\n']
    self.dels += ['\n}\n\n']
    self.decs += ['\n}\n\n']
    self.ffi += ['\n}\n\n']
    self.jsadapter += ['\n}\n\n']
    self.jsimpl_intr += ['\n}\n\n']
    self.jsimpl_extn += ['\n}\n\n']

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
    self.jsimpl_intr = []
    self.jsimpl_extn = []
    self.enums = []
    
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
    self.jsimpl_intr += class_set.jsimpl_intr
    self.jsimpl_extn += class_set.jsimpl_extn
  
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
      for x in self.jsimpl_intr:
        dart.write(x)
      for x in self.jsimpl_extn:
        dart.write(x)
    with open('out/b2_enums.dart', 'w') as dart:
      for x in self.enums:
        dart.write(x)

pre_itf = r'''import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'b2_delegates.dart';

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

pre_itf_mac = '''import 'package:flutter_box2d_platform_interface/b2_delegates.dart';
import 'package:flutter_box2d_platform_interface/flutter_box2d_platform_interface.dart';

import 'b2_adapters_ffi.dart';

/// The macos implementation of the FlutterBox2d plugin.
class FlutterBox2DMacos extends FlutterBox2DPlatform {
  // Called by code generated at build-time to setup the appropriate platform implementation.
  static void registerWith() {
    FlutterBox2DPlatform.instance = FlutterBox2DMacos();
  }

  FlutterBox2DMacos();
''';

pre_itf_web = '''import 'package:flutter_box2d_platform_interface/b2_delegates.dart';
import 'package:flutter_box2d_platform_interface/flutter_box2d_platform_interface.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';

import 'b2_adapters_web.dart';

/// The web implementation of the FlutterBox2d plugin.
class FlutterBox2DWeb extends FlutterBox2DPlatform {
  // Called by code generated at build-time to setup the appropriate platform implementation.
  static void registerWith(Registrar registrar) {
    FlutterBox2DPlatform.instance = FlutterBox2DWeb();
  }
''';

pre_decs = '''import 'package:flutter_box2d_platform_interface/flutter_box2d_platform_interface.dart';

import 'b2_delegates.dart';
import 'b2_enums.dart';

'''

pre_dels = '''import 'b2_enums.dart';

'''

pre_ffi = '''import 'dart:ffi';

import 'package:flutter_box2d_platform_interface/b2_delegates.dart';
import 'package:flutter_box2d_platform_interface/b2_enums.dart';

final DynamicLibrary _symbols = DynamicLibrary.process();

typedef EmptyConstructor = Pointer<Void> Function();

'''

pre_js = '''// ignore_for_file: non_constant_identifier_names
// ignore_for_file: annotate_overrides
@JS()
library box2d;

import 'package:js/js.dart';

import 'package:flutter_box2d_platform_interface/b2_delegates.dart';
import 'package:flutter_box2d_platform_interface/b2_enums.dart';

'''
