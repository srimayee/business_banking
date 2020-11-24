import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group('Banking App Driver Tests:', () {
    final signInText = find.byValueKey('signInText');
    final loginButton = find.byValueKey('login_button_key');
    final accountCard = find.byValueKey('accountCard1');
    final cashAccountBalance = find.byValueKey('balance');
    final cashAccountAppBar = find.byValueKey('CAappBarName');
    final backButton = find.byValueKey('backButton');
    final accountDetailAppBar = find.byValueKey('ADappBarL4');
    final bigBalance = find.byValueKey('bigBalance');
    final depHold = find.byValueKey('depHold');
    final customerTileText = find.byValueKey('HCTileText');
    final customerTileButton = find.byValueKey('HCTileButton');
    final customerDetailAppBar = find.byValueKey('HCDappBarName');
    final customerDetailName = find.byValueKey('HCDname');
    final customerDetailWeather = find.byValueKey('HCDweather');
    final customerDetailAddress = find.byValueKey('HCDaddress');
    final customerBackButton = find.pageBack();
    
    FlutterDriver driver;
    
    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    tearDownAll(() async {
      if (driver != null) {
        driver.close();
      }
    });
    
    // These will only pass with the specific JSON included in the Mockoon folder
    
    test('LoginScreen, screen is displayed', () async {
      expect(await driver.getText(signInText), 'Sign In');
    });
    
    test('CashAccountsScreen, navigated to and app bar is displayed', () async {
      await driver.tap(loginButton);
      await driver.waitForAbsent(loginButton);
      expect(await driver.getText(cashAccountAppBar), 'Business Banking');
    });
    
    test('CashAccountsScreen, account balance is displayed on card', () async {
      expect(await driver.getText(cashAccountBalance), '\$3545.54');
    });
    
    test('AccountDetailScreen, app bar is displayed', () async {
      await driver.tap(accountCard);
      expect(await driver.getText(accountDetailAppBar), '*6542');
    });
    
    test('AccountDetailScreen, account balance is displayed', () async {
      expect(await driver.getText(bigBalance), '\$3545.54');
    });
    
    test('AccountDetailScreen, deposit hold ammount is displayed on card', () async {
      expect(await driver.getText(depHold), '\$0.00');
    });
    
    test('CashAccountScreen, check to find correct app bar', () async {
      await driver.tap(backButton);
      await driver.waitForAbsent(accountDetailAppBar);
      expect(await driver.getText(cashAccountAppBar), 'Business Banking');
    });

    test('CustomerScreen, Hello Joe is displayed on tile', () async {
      expect(await driver.getText(customerTileText), 'Hello Mr. Joe A');
    });

    test('CustomerDetailScreen, navigate to and app bar is displayed', () async {
      await driver.tap(customerTileButton);
      await driver.waitForAbsent(customerTileButton);
      expect(await driver.getText(customerDetailAppBar), 'Hello Customer');
    });

    test('CustomerDetailScreen, name weather address is displayed on screen', () async {
      expect(await driver.getText(customerDetailName), 'Hello Mr. Joe A');
      expect(await driver.getText(customerDetailWeather), 'sunny');
      expect(await driver.getText(customerDetailAddress), '1234 ABCD Rd, City, State 00000');
    });
    
    test('CustomerScreen, check to find correct app bar', () async {
      await driver.tap(customerBackButton);
      await driver.waitForAbsent(customerDetailAppBar);
      expect(await driver.getText(cashAccountAppBar), 'Business Banking');
    });
  });
}
