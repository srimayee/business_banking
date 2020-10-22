import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group('Banking App Driver Tests:', () {
    final signInText = find.byValueKey('signInText');
    final loginButton = find.byValueKey('login_button_key');

    /// Cash Accounts - Card 1
    //final cashAccountsCardOne = find.byValueKey('cashAccountsCard1');
    final cashAccountsCardOneLastFourAccountNumber = find.byValueKey('cashAccountsCard1AccountNumber');
    final cashAccountsCardOneAccountBalance = find.byValueKey('cashAccountsCard1Balance');
    final cashAccountsCardOneAccountType = find.byValueKey('cashAccountsCard1AccountType');
    final cashAccountsCardOneAccountStatus = find.byValueKey('cashAccountsCard1AccountStatus');

    /// Cash Accounts - Card 2
    //final cashAccountsCardTwo = find.byValueKey('cashAccountsCard2');
    final cashAccountsCardTwoLastFourAccountNumber = find.byValueKey('cashAccountsCard2AccountNumber');
    final cashAccountsCardTwoAccountBalance = find.byValueKey('cashAccountsCard2Balance');
    final cashAccountsCardTwoAccountType = find.byValueKey('cashAccountsCard2AccountType');
    final cashAccountsCardTwoAccountStatus = find.byValueKey('cashAccountsCard2AccountStatus');

    final cashAccountAppBar = find.byValueKey('CAappBarName');
    //final backButton = find.byValueKey('backButton');
    
    FlutterDriver driver;
    
    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    tearDownAll(() async {
      if (driver != null) {
        driver.close();
      }
    });
    
    /// These will only pass with the specific JSON included in the Mockoon folder
    test('LoginScreen, screen is displayed', () async {
       expect(await driver.getText(signInText), 'Sign In');
    });
    
    test('CashAccountsScreen, navigated to and app bar is displayed', () async {
      await driver.tap(loginButton);
      await driver.waitForAbsent(loginButton);
      expect(await driver.getText(cashAccountAppBar), 'Business Banking');
    });
    
    test('CashAccountsScreen, displaying Card 1 Data', () async {
      expect(await driver.getText(cashAccountsCardOneLastFourAccountNumber), '...6542');
      expect(await driver.getText(cashAccountsCardOneAccountBalance), '\$3,545.54');
      expect(await driver.getText(cashAccountsCardOneAccountType), 'Cash');
      expect(await driver.getText(cashAccountsCardOneAccountStatus), 'Active');
    });

    test('CashAccountsScreen, displaying Card 2 Data', () async {
      expect(await driver.getText(cashAccountsCardTwoLastFourAccountNumber), '...6543');
      expect(await driver.getText(cashAccountsCardTwoAccountBalance), '\$0.02');
      expect(await driver.getText(cashAccountsCardTwoAccountType), 'Cash');
      expect(await driver.getText(cashAccountsCardTwoAccountStatus), 'Active');
    });
  });
}
