import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moony_nav_bar/moony_nav_bar_flutter.dart';

void main() {
  const MethodChannel channel = MethodChannel('moony_nav_bar_flutter');

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
    expect(await MoonyNavBarFlutter.platformVersion, '42');
  });
}
