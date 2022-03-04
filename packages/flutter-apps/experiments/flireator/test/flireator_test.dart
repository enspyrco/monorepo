import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flireator/flireator.dart';

void main() {
  const MethodChannel channel = MethodChannel('flireator');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await Flireator.platformVersion, '42');
  });
}
