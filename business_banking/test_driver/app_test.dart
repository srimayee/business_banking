import 'dart:io';

import 'package:flutter_driver/flutter_driver.dart';
import 'package:intl/intl.dart';
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
    // transfer funds widgets
    // transfer funds screen widgets
    final transferFundsButton = find.byValueKey('transfer_funds_button');
    final transferFundsBarTitle = find.byValueKey('transfer_funds_bar_title');
    final fromLabel = find.byValueKey('from_label');
    final fromAccountDropdown = find.byType('FromAccountsDropDown');
    final toLabel = find.byValueKey('to_label');
    final toAccountDropdown = find.byValueKey('ToAccountsDropDown');
    final amountLabel = find.byValueKey('amount_label');
    final amountTextField = find.byValueKey('amount_text_field');
    final dateLabel = find.byValueKey('date_label');
    final dateTextField = find.byValueKey('date_text_field');
    
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

    // transfer funds feature
    test('TransferFundsScreen, navigated to and app bar is displayed', () async {
      await driver.tap(transferFundsButton);
      await driver.waitForAbsent(transferFundsButton);
      expect(await driver.getText(transferFundsBarTitle), 'Transfer Funds');
    });

    test('TransferFundsScreen, check from label is displayed', () async {
      expect(await driver.getText(fromLabel), 'From');
    });

    test('TransferFundsScreen, check to label is displayed', () async {
      expect(await driver.getText(toLabel), 'To');
    });

    test('TransferFundsScreen, check amount label is displayed', () async {
      expect(await driver.getText(amountLabel), 'Amount');
    });

    test('TransferFundsScreen, check amount field is displayed', () async {
      expect(await driver.getText(amountTextField), '');
    });

    test('TransferFundsScreen, check date label is displayed', () async {
      expect(await driver.getText(dateLabel), 'Transfer date');
    });

    test('TransferFundsScreen, check date field is displayed', () async {
      expect(await driver.getText(dateTextField), DateFormat('MM/dd/yyyy').format(DateTime.now()));
    });

    test('TransferFundsScreen, choose from account and enter amount', () async {
      await driver.tap(fromAccountDropdown);
      await driver.tap(find.text('1111111111'));
      await driver.waitFor(find.text('1111111111'));
      print('account from selected');
      await driver.tap(amountTextField);
      print('selected amount text field');
      await driver.enterText('10.5');
      print('entered amount');
      await driver.waitFor(find.text('10.5'));
    });

    // test('TransferFundsScreen, choose to account', () async {
    //   sleep(Duration(seconds: 2));
    //   await driver.tap(toAccountDropdown);
    //   await driver.tap(find.text('5555555555'));
    //   await driver.waitFor(find.text('5555555555'));
    // });
  });
}
