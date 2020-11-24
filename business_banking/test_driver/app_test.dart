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
    final helloCustomerTileText = find.byValueKey('HCTileText');
    final helloCustomerTileButton = find.byValueKey('HCTileButton');
    final helloCustomerDetailAppBar = find.byValueKey('HCDappBarName');
    final helloCustomerDetailName = find.byValueKey('HCDname');
    final helloCustomerDetailWeather = find.byValueKey('HCDweather');
    final helloCustomerDetailAddress = find.byValueKey('HCDaddress');
    final helloCustomerBackButton = find.pageBack();
    
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

    test('HelloCustomerScreen, Hello Joe is displayed on tile', () async {
      expect(await driver.getText(helloCustomerTileText), 'Hello Mr. Joe A');
    });

    test('HelloCustomerDetailScreen, navigate to and app bar is displayed', () async {
      await driver.tap(helloCustomerTileButton);
      await driver.waitForAbsent(helloCustomerTileButton);
      expect(await driver.getText(helloCustomerDetailAppBar), 'Hello Customer');
    });

    test('HelloCustomerDetailScreen, name weather address is displayed on screen', () async {
      expect(await driver.getText(helloCustomerDetailName), 'Hello Mr. Joe A');
      expect(await driver.getText(helloCustomerDetailWeather), 'sunny');
      expect(await driver.getText(helloCustomerDetailAddress), '1234 ABCD Rd, City, State 00000');
    });
    
    test('HelloCustomerScreen, check to find correct app bar', () async {
      await driver.tap(helloCustomerBackButton);
      await driver.waitForAbsent(helloCustomerDetailAppBar);
      expect(await driver.getText(cashAccountAppBar), 'Business Banking');
    });
  });
}
