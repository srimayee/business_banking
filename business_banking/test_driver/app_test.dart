// import 'package:business_banking/features/side_cash_enrollment/side_cash_enrollment_keys.dart' as k;
import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group("Side Cash Enrollment Driver Tests: ", () {
    final advertisementMessage =
        find.byValueKey("sideCashEnrollAdvertisementHeader");
    final advertisememntTapToEnrollButton =
        find.byValueKey('sideCashEnrollButton');
    final formRegistrationScaffold = find.byValueKey("enrollmentFormScaffold");

    final savingsRadioTile =
        find.byValueKey("side_cash_account_radio_button-savings-123");
    final checkingRadioTile =
        find.byValueKey("side_cash_account_radio_button-checking-234");
    final submitButton = find.byValueKey('formSubmitButton');
    final alertDialog = find.byValueKey('enrollmentFormSubmitErrorDialog');
    final dismissButton =
        find.byValueKey("dismissEnrollmentFormErrorDialogButton");

    final registrationCompleteAppBarText =
        find.byValueKey("enrollmentCompletionAppBarText");
    final registrationCompleteScaffold =
        find.byValueKey("enrollmentCompletionScaffold");
    final registrationSuccessMessage = find.byValueKey("completionMessage");
    final registrationSuccessBooleanMessage =
        find.byValueKey("successBooleanMessage");
    final exitRegistrationButton =
        find.byValueKey("exitEnrollmentFeatureButton");
    final exitRegistrationButtonText =
        find.byValueKey("exitEnrollmentFeatureButtonText");

    final hubAppBarText = find.byValueKey("CAappBarName");

    FlutterDriver driver;
    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    tearDownAll(() async {
      if (driver != null) {
        driver.close();
      }
    });

    test(
        "advertisement is on hub screen and navigation to form scaffold works ",
        () async {
      expect(
          await driver.getText(advertisementMessage), "Sign Up for Side Cash!");
      driver.tap(advertisememntTapToEnrollButton);
      await driver.waitFor(formRegistrationScaffold,
          timeout: Duration(seconds: 5));
    });

    test(
        "tapping enroll on SideCashEnrollmentFormScreen without selecting an account shows error dialog. Tapping okay dismisses it",
        () async {
      driver.tap(submitButton);
      await driver.waitFor(alertDialog, timeout: Duration(seconds: 5));
      driver.tap(dismissButton);
      await driver.waitForAbsent(alertDialog, timeout: Duration(seconds: 5));
    });

    test(
        "tapping enroll after selecting Checking Account will navigate to completion page(/submit form)",
        () async {
      driver.tap(checkingRadioTile);
      driver.tap(submitButton);
      await driver.waitFor(registrationCompleteScaffold,
          timeout: Duration(seconds: 5));
    });

    test("enrollment completion screen contains expected data", () async {
      expect(await driver.getText(registrationCompleteAppBarText),
          "completion Screen");
      expect(await driver.getText(registrationSuccessMessage),
          "Message: congrats you are enrolled!");
      expect(await driver.getText(registrationSuccessBooleanMessage),
          "was successful: true");
      expect(await driver.getText(exitRegistrationButtonText), "Exit Feature!");
    });

    test(
        "tapping exitRegistrationButton returns user to home screen, also there is no back button",
        () async {
      driver.tap(exitRegistrationButton);
      await driver.waitFor(hubAppBarText, timeout: Duration(seconds: 5));
      // NOT SURE IF THIS IS VALID
      await driver.waitForAbsent(find.byTooltip("Back"),
          timeout: Duration(seconds: 5));
    });
  });

  // group('Banking App Driver Tests:', () {
  //   final signInText = find.byValueKey('signInText');
  //   final loginButton = find.byValueKey('login_button_key');
  //   final accountCard = find.byValueKey('accountCard1');
  //   final cashAccountBalance = find.byValueKey('balance');
  //   final cashAccountAppBar = find.byValueKey('CAappBarName');
  //   final backButton = find.byValueKey('backButton');
  //   final accountDetailAppBar = find.byValueKey('ADappBarL4');
  //   final bigBalance = find.byValueKey('bigBalance');
  //   final depHold = find.byValueKey('depHold');
  //   final customerTileText = find.byValueKey('HCTileText');
  //   final customerTileButton = find.byValueKey('HCTileButton');
  //   final customerDetailAppBar = find.byValueKey('HCDappBarName');
  //   final customerDetailName = find.byValueKey('HCDname');
  //   final customerDetailWeather = find.byValueKey('HCDweather');
  //   final customerDetailAddress = find.byValueKey('HCDaddress');
  //   final customerBackButton = find.pageBack();
  //
  //   // transfer funds widgets
  //   // transfer funds screen widgets
  //   final transferFundsButton = find.byValueKey('transfer_funds_button');
  //   final transferFundsBarTitle = find.byValueKey('transfer_funds_bar_title');
  //   final transferFromAccountLabel = find.byValueKey('from_label');
  //   final fromAccountDropdown = find.byType('FromAccountsDropDown');
  //   final toLabel = find.byValueKey('to_label');
  //   final toAccountDropdown = find.byType('ToAccountsDropDown');
  //   final amountLabel = find.byValueKey('amount_label');
  //   final amountTextField = find.byValueKey('amount_text_field');
  //   final dateLabel = find.byValueKey('date_label');
  //   final dateTextField = find.byValueKey('date_text_field');
  //   final submitTransferButton = find.byValueKey('submit_transfer_button');
  //   // transfer confirmation screen widgets
  //   final transferConfirmationBarTitle = find.byValueKey('transfer_confirmation_bar_title');
  //   final transferConfirmationTitle = find.byValueKey('transaction_confirmation_title');
  //   final transferConfirmationIdLabel = find.byValueKey('transfer_confirmation_id_label');
  //   final transferConfirmationIdField = find.byValueKey('transfer_confirmation_id_field');
  //   final transferConfirmationDateLabel = find.byValueKey('transfer_confirmation_date_label');
  //   final transferConfirmationDateField = find.byValueKey('transfer_confirmation_date_field');
  //   final transferConfirmationFromAccountLabel = find.byValueKey('transfer_confirmation_from_account_label');
  //   final transferConfirmationFromAccountField = find.byValueKey('transfer_confirmation_from_account_field');
  //   final transferConfirmationToAccountLabel = find.byValueKey('transfer_confirmation_to_account_label');
  //   final transferConfirmationToAccountField = find.byValueKey('transfer_confirmation_to_account_field');
  //   final transferConfirmationAmountLabel = find.byValueKey('transfer_confirmation_amount_label');
  //   final transferConfirmationAmountField = find.byValueKey('transfer_confirmation_amount_field');
  //   final transferConfirmationTypeLabel = find.byValueKey('transfer_confirmation_type_label');
  //   final transferConfirmationTypeField = find.byValueKey('transfer_confirmation_type_field');
  //   final anotherTransferButton = find.byValueKey('make_another_transfer_button');
  //   FlutterDriver driver;
  //
  //   setUpAll(() async {
  //     driver = await FlutterDriver.connect();
  //   });
  //
  //   tearDownAll(() async {
  //     if (driver != null) {
  //       driver.close();
  //     }
  //   });

  //   // These will only pass with the specific JSON included in the Mockoon folder
  //
  //   test('LoginScreen, screen is displayed', () async {
  //     expect(await driver.getText(signInText), 'Sign In');
  //   });
  //
  //   test('CashAccountsScreen, navigated to and app bar is displayed', () async {
  //     await driver.tap(loginButton);
  //     await driver.waitForAbsent(loginButton);
  //     expect(await driver.getText(cashAccountAppBar), 'Business Banking');
  //   });
  //
  //   test('CashAccountsScreen, account balance is displayed on card', () async {
  //     expect(await driver.getText(cashAccountBalance), '\$3545.54');
  //   });
  //
  //   test('AccountDetailScreen, app bar is displayed', () async {
  //     await driver.tap(accountCard);
  //     expect(await driver.getText(accountDetailAppBar), '*6542');
  //   });
  //
  //   test('AccountDetailScreen, account balance is displayed', () async {
  //     expect(await driver.getText(bigBalance), '\$3545.54');
  //   });
  //
  //   test('AccountDetailScreen, deposit hold ammount is displayed on card', () async {
  //     expect(await driver.getText(depHold), '\$0.00');
  //   });
  //
  //   test('CashAccountScreen, check to find correct app bar', () async {
  //     await driver.tap(backButton);
  //     await driver.waitForAbsent(accountDetailAppBar);
  //     expect(await driver.getText(cashAccountAppBar), 'Business Banking');
  //   });
  //
  //   test('CustomerScreen, Hello Joe is displayed on tile', () async {
  //     expect(await driver.getText(customerTileText), 'Hello Mr. Joe A');
  //   });
  //
  //   test('CustomerDetailScreen, navigate to and app bar is displayed', () async {
  //     await driver.tap(customerTileButton);
  //     await driver.waitForAbsent(customerTileButton);
  //     expect(await driver.getText(customerDetailAppBar), 'Hello Customer');
  //   });
  //
  //   test('CustomerDetailScreen, name weather address is displayed on screen', () async {
  //     expect(await driver.getText(customerDetailName), 'Hello Mr. Joe A');
  //     expect(await driver.getText(customerDetailWeather), 'sunny');
  //     expect(await driver.getText(customerDetailAddress), '1234 ABCD Rd, City, State 00000');
  //   });
  //
  //   test('CustomerScreen, check to find correct app bar', () async {
  //     await driver.tap(customerBackButton);
  //     await driver.waitForAbsent(customerDetailAppBar);
  //     expect(await driver.getText(cashAccountAppBar), 'Business Banking');
  //   });
  //
  //   // transfer funds feature
  //   test('TransferFundsScreen, navigated to and app bar is displayed', () async {
  //     await driver.tap(transferFundsButton);
  //     await driver.waitForAbsent(transferFundsButton);
  //     expect(await driver.getText(transferFundsBarTitle), 'Transfer Funds');
  //   });
  //
  //   test('TransferFundsScreen, check from label is displayed', () async {
  //     expect(await driver.getText(transferFromAccountLabel), 'From');
  //   });
  //
  //   test('TransferFundsScreen, check to label is displayed', () async {
  //     expect(await driver.getText(toLabel), 'To');
  //   });
  //
  //   test('TransferFundsScreen, check amount label is displayed', () async {
  //     expect(await driver.getText(amountLabel), 'Amount');
  //   });
  //
  //   test('TransferFundsScreen, check amount field is displayed', () async {
  //     expect(await driver.getText(amountTextField), '');
  //   });
  //
  //   test('TransferFundsScreen, check date label is displayed', () async {
  //     expect(await driver.getText(dateLabel), 'Transfer date');
  //   });
  //
  //   test('TransferFundsScreen, check date field is displayed', () async {
  //     expect(await driver.getText(dateTextField), DateFormat('MM/dd/yyyy').format(DateTime.now()));
  //   });
  //
  //   test('TransferFundsScreen, fill transfer form and navigate to confirmation screen', () async {
  //     // select from account
  //     await driver.tap(fromAccountDropdown);
  //     await driver.tap(find.text('1111111111'));
  //     await driver.waitFor(find.text('1111111111'));
  //     // select data
  //     await driver.tap(dateTextField);
  //     await driver.tap(find.text('16'));
  //     await driver.tap(find.text('OK'));
  //     // enter amount 10.5
  //     await driver.tap(amountTextField);
  //     await driver.enterText('10.5');
  //     // choose to account
  //     await driver.tap(toAccountDropdown);
  //     await driver.tap(find.text('5555555555'));
  //     await driver.waitFor(find.text('5555555555'));
  //     await driver.waitFor(find.text('10.5'));
  //   });
  //
  //   test('TransferConfirmationScreen, navigated to and app bar is displayed', () async {
  //     await driver.tap(submitTransferButton);
  //     await driver.waitForAbsent(submitTransferButton);
  //     expect(await driver.getText(transferConfirmationBarTitle), 'Transfer Confirmation');
  //   });
  //
  //   test('TransferConfirmationScreen, check all transfer confirmation data displayed', () async {
  //     DateTime now = DateTime.now();
  //     int month = now.month;
  //     int year = now.year;
  //     String date = '$month/16/$year';
  //     expect(await driver.getText(transferConfirmationTitle), 'Transaction');
  //     expect(await driver.getText(transferConfirmationIdLabel), 'Confirmation #:');
  //     expect(await driver.getText(transferConfirmationIdField), '123456789');
  //     expect(await driver.getText(transferConfirmationDateLabel), 'Transfer Date');
  //     expect(await driver.getText(transferConfirmationDateField), date);
  //     expect(await driver.getText(transferConfirmationFromAccountLabel), 'From');
  //     expect(await driver.getText(transferConfirmationFromAccountField), '1111111111');
  //     expect(await driver.getText(transferConfirmationToAccountLabel), 'To');
  //     expect(await driver.getText(transferConfirmationToAccountField), '5555555555');
  //     expect(await driver.getText(transferConfirmationAmountLabel), 'Amount');
  //     expect(await driver.getText(transferConfirmationAmountField), '\$10.5');
  //     expect(await driver.getText(transferConfirmationTypeLabel), 'Type');
  //     expect(await driver.getText(transferConfirmationTypeField), 'Transfer');
  //   });
  //
  //   test('TransferFundsScreen, navigating back from TransferConfirmation screen by pushing Make another transfer button', () async {
  //     await driver.tap(anotherTransferButton);
  //     await driver.waitForAbsent(anotherTransferButton);
  //     expect(await driver.getText(transferFundsBarTitle), 'Transfer Funds');
  //   });
  //
  //   test('TransferFundsScreen, check transfer form was reset', () async {
  //     DateTime now = DateTime.now();
  //     String date = '${now.month}/${now.day}/${now.year}';
  //     await driver.waitFor(find.text('Select a From Account'));
  //     await driver.waitFor(find.text('Select a To Account'));
  //     expect(await driver.getText(amountTextField), '');
  //     expect(await driver.getText(dateTextField), date);
  //   });
  //
  //   test('CashAccountScreen, navigating back from TransferFundsScreen, check to find correct app bar', () async {
  //     await driver.tap(find.pageBack());
  //     await driver.waitForAbsent(transferFundsBarTitle);
  //     expect(await driver.getText(cashAccountAppBar), 'Business Banking');
  //   });
  // });
}
