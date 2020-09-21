import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group('Banking App Driver Tests:', () {
    final signInText = find.byValueKey('signInText');
    final loginButton = find.byValueKey('login_button_key');
    final btnBillPay = find.byValueKey('PayBtn');
    final billPayAppBar = find.byValueKey('CBillPayAppBarTitle');
    final btnOK = find.byValueKey('BtnOK');

    FlutterDriver driver;

    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    tearDownAll(() async {
      if (driver != null) {
        driver.close();
      }
    });

    test('LoginScreen, screen is displayed', () async {
      expect(await driver.getText(signInText), 'Sign In');
    });
    test('Bill Pay Screen, navigated to and app bar is displayed', () async {
      await driver.tap(loginButton);
      await driver.waitForAbsent(loginButton);
      expect(await driver.getText(billPayAppBar), 'Bill Pay');
    });

    test('Tap on Pay, Alert should be displayed', () async {
      await driver.tap(btnBillPay);
      await Future.delayed(Duration(milliseconds: 2000));
      await driver.tap(btnOK);
    });
  });
}
