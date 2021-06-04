// @dart = 2.9
import 'package:business_banking/features/stocks_portfolio/bloc/stocks_bloc.dart';
import 'package:business_banking/features/stocks_portfolio/ui/stocks_list_presenter.dart';
import 'package:business_banking/features/stocks_portfolio/ui/stocks_list_widget.dart';
import 'package:business_banking/features/stocks_portfolio/ui/stocks_portfolio_presenter.dart';
import 'package:business_banking/features/stocks_portfolio/ui/stocks_portfolio_widget.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import './integration_test_helpers.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  group('Banking App Integration Tests:', () {
    final signInText = 'signInText';
    final loginButton = 'login_button_key';

    // hub
    final hubAppBar = find.byKey(Key('CAappBarName'));

    // Cash Accounts - Card
    final cashAccountsCardOne = 'accountCard1';

    // Cash Accounts - Detail
    final backButton = find.byKey(Key('backButton'));
    final accountDetailAppBar = find.byKey(Key('ADappBarL4'));
    final bigBalance = find.byKey(Key('bigBalance'));
    final depHold = find.byKey(Key('depHold'));

    // Customer - Tile
    final customerTileText = find.byKey(Key('HCTileText'));
    final customerTileButton = 'HCTileButton';

    // Customer - Detail
    final customerDetailAppBar = find.byKey(Key('HCDappBarName'));
    final customerDetailName = find.byKey(Key('HCDname'));
    final customerDetailAddress = find.byKey(Key('HCDaddress'));
    // final customerBackButton = find.bySemanticsLabel("Back");
/*
    // transfer funds widgets
    // transfer funds screen widgets
    final transferFundsButton = find.byKey(Key('transfer_funds_button'));
    final transferFundsBarTitle = find.byKey(Key('transfer_funds_bar_title'));
    final transferFromAccountLabel = find.byKey(Key('from_label'));
//    final fromAccountDropdown = find.byType('FromAccountsDropDown'));
    final toLabel = find.byKey(Key('to_label'));
//    final toAccountDropdown = find.byType('ToAccountsDropDown'));
    final amountLabel = find.byKey(Key('amount_label'));
    final amountTextField = find.byKey(Key('amount_text_field'));
    final dateLabel = find.byKey(Key('date_label'));
    final dateTextField = find.byKey(Key('date_text_field'));
    final submitTransferButton = find.byKey(Key('submit_transfer_button'));
    // transfer confirmation screen widgets
    final transferConfirmationBarTitle =
        find.byKey(Key('transfer_confirmation_bar_title'));
    final transferConfirmationTitle =
        find.byKey(Key('transaction_confirmation_title'));
    final transferConfirmationIdLabel =
        find.byKey(Key('transfer_confirmation_id_label'));
    final transferConfirmationIdField =
        find.byKey(Key('transfer_confirmation_id_field'));
    final transferConfirmationDateLabel =
        find.byKey(Key('transfer_confirmation_date_label'));
    final transferConfirmationDateField =
        find.byKey(Key('transfer_confirmation_date_field'));
    final transferConfirmationFromAccountLabel =
        find.byKey(Key('transfer_confirmation_from_account_label'));
    final transferConfirmationFromAccountField =
        find.byKey(Key('transfer_confirmation_from_account_field'));
    final transferConfirmationToAccountLabel =
        find.byKey(Key('transfer_confirmation_to_account_label'));
    final transferConfirmationToAccountField =
        find.byKey(Key('transfer_confirmation_to_account_field'));
    final transferConfirmationAmountLabel =
        find.byKey(Key('transfer_confirmation_amount_label'));
    final transferConfirmationAmountField =
        find.byKey(Key('transfer_confirmation_amount_field'));
    final transferConfirmationTypeLabel =
        find.byKey(Key('transfer_confirmation_type_label'));
    final transferConfirmationTypeField =
        find.byKey(Key('transfer_confirmation_type_field'));
    final anotherTransferButton =
        find.byKey(Key('make_another_transfer_button'));
*/
    /// These will only pass with the specific JSON included in the Mockoon folder
    testWidgets('Integration test', (WidgetTester tester) async {
      tester.ensureSemantics();

      // final signInText = 'signInText';
      // final loginButton = 'login_button_key';

      // // hub
      // final hubAppBar = find.byKey(Key('CAappBarName'));

      // // Cash Accounts - Card
      // final cashAccountsCardOne = 'accountCard1';

      // // Cash Accounts - Detail
      // final backButton = find.byKey(Key('backButton'));
      // final accountDetailAppBar = find.byKey(Key('ADappBarL4'));
      // final bigBalance = find.byKey(Key('bigBalance'));
      // final depHold = find.byKey(Key('depHold'));

      // // Customer - Tile
      // final customerTileText = find.byKey(Key('HCTileText'));
      // final customerTileButton = 'HCTileButton';

      // // Customer - Detail
      // final customerDetailAppBar = find.byKey(Key('HCDappBarName'));
      // final customerDetailName = find.byKey(Key('HCDname'));
      // final customerDetailAddress = find.byKey(Key('HCDaddress'));
      final customerBackButton = find.bySemanticsLabel("Back");

      final stocksHubCard = find.byKey(Key('StocksHubCard'));
      final stocksText = find.byKey(Key('StocksPortText'));

      await startTest(tester);

      //LoginScreen, screen is displayed
      await didWidgetAppear(signInText);
      await didTextAppear('Sign In');

      //navigated to and app bar is displayed
      await tapWidget(loginButton);
      expect(tester.widget<Text>(hubAppBar).data, 'Business Banking');

      //CashAccountsScreen, displaying Card Data
      await didWidgetAppear(cashAccountsCardOne);
      await didTextAppear(' *6542');
      await didTextAppear('\$3545.54');

      //CashAccountsDetailScreen, navigate to and app bar is displayed
      await tapWidget(cashAccountsCardOne);
      expect(tester.widget<Text>(accountDetailAppBar).data, '*6542');

      //CashAccountsDetailScreen, beginBalance pendingTransactions depositHolds balance type routingNum is displayed on screen
      await didTextAppear("\$3674.43");
      await didTextAppear("-\$128.89");
      expect(tester.widget<Text>(depHold).data, "\$0.00");
      expect(tester.widget<Text>(bigBalance).data, "\$3545.54");
      await didTextAppear("Account Type: Employee Checking");
      await didTextAppear("Routing Number: 746395735");

      //CashAccountsDetailScreen, back to hub
      await tapWithFinder(backButton);

      //CustomerScreen, Hello Joe is displayed on tile
      // expect(tester.widget<Text>(customerTileText).data, 'Hello Mr. Joe A');

      // //CustomerDetailScreen, navigate to and app bar is displayed
      // await tapWidget(customerTileButton);
      // expect(tester.widget<Text>(customerDetailAppBar).data, 'Hello Customer');

      // //CustomerDetailScreen, name address is displayed on screen
      // expect(tester.widget<Text>(customerDetailName).data, 'Hello Mr. Joe A');
      // expect(tester.widget<Text>(customerDetailAddress).data,
      //     '1234 ABCD Rd, City, State 00000');

      // //CustomerScreen, check to find correct app bar
      // await tapWithFinder(customerBackButton);
    });

    testWidgets('StocksPortfolioScreen', (WidgetTester tester) async {
      await startTest(tester);
      final signInText = 'signInText';
      final loginButton = 'login_button_key';

      await didWidgetAppear(signInText);
      await didTextAppear('Sign In');

      //navigated to and app bar is displayed
      await tapWidget(loginButton);
      // expect(tester.widget<Text>(hubAppBar).data, 'Business Banking');

      await didTextAppear('Stocks Portfolio');
      await tapWidget('StocksHubCard');
      await didTextAppear('Stocks');

      await tapWidget('StockTile');
      await didTextAppear('Details');
    });

    testWidgets('StocksPortfolio, with true bloc', (tester) async {
      final testWidget = MaterialApp(
          home: BlocProvider<StocksBloc>(
              create: (_) => StocksBloc(), child: StocksPortfolioWidget()));

      await tester.pumpWidget(testWidget);
      await tester.pump(Duration(milliseconds: 500));

      expect(find.byType(StocksPortfolioPresenter), findsOneWidget);
    });

    testWidgets('StocksList, with true bloc', (tester) async {
      final testWidget = MaterialApp(
          home: BlocProvider<StocksBloc>(
              create: (_) => StocksBloc(), child: StocksListWidget()));

      await tester.pumpWidget(testWidget);
      await tester.pump(Duration(milliseconds: 500));

      expect(find.byType(StocksListPresenter), findsOneWidget);
    });
/*
    // transfer funds feature
    test('TransferFundsScreen, navigated to and app bar is displayed',
        () async {
      await driver.tap(transferFundsButton);
      await driver.waitForAbsent(transferFundsButton);
      expect(await driver.getText(transferFundsBarTitle), 'Transfer Funds');
    });

    test('TransferFundsScreen, check from label is displayed', () async {
      expect(await driver.getText(transferFromAccountLabel), 'From');
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
      expect(await driver.getText(dateTextField),
          DateFormat('MM/dd/yyyy').format(DateTime.now()));
    });

    test(
        'TransferFundsScreen, fill transfer form and navigate to confirmation screen',
        () async {
      // select from account
      await driver.tap(fromAccountDropdown);
      await driver.tap(find.text('1111111111'));
      await driver.waitFor(find.text('1111111111'));
      // select data
      await driver.tap(dateTextField);
      await driver.tap(find.text('16'));
      await driver.tap(find.text('OK'));
      // enter amount 10.5
      await driver.tap(amountTextField);
      await driver.enterText('10.5');
      // choose to account
      await driver.tap(toAccountDropdown);
      await driver.tap(find.text('5555555555'));
      await driver.waitFor(find.text('5555555555'));
      await driver.waitFor(find.text('10.5'));
    });

    test('TransferConfirmationScreen, navigated to and app bar is displayed',
        () async {
      await driver.tap(submitTransferButton);
      await driver.waitForAbsent(submitTransferButton);
      expect(await driver.getText(transferConfirmationBarTitle),
          'Transfer Confirmation');
    });

    test(
        'TransferConfirmationScreen, check all transfer confirmation data displayed',
        () async {
      DateTime now = DateTime.now();
      int month = now.month;
      int year = now.year;
      String date = '$month/16/$year';
      expect(await driver.getText(transferConfirmationTitle), 'Transaction');
      expect(
          await driver.getText(transferConfirmationIdLabel), 'Confirmation #:');
      expect(await driver.getText(transferConfirmationIdField), '123456789');
      expect(
          await driver.getText(transferConfirmationDateLabel), 'Transfer Date');
      expect(await driver.getText(transferConfirmationDateField), date);
      expect(
          await driver.getText(transferConfirmationFromAccountLabel), 'From');
      expect(await driver.getText(transferConfirmationFromAccountField),
          '1111111111');
      expect(await driver.getText(transferConfirmationToAccountLabel), 'To');
      expect(await driver.getText(transferConfirmationToAccountField),
          '5555555555');
      expect(await driver.getText(transferConfirmationAmountLabel), 'Amount');
      expect(await driver.getText(transferConfirmationAmountField), '\$10.5');
      expect(await driver.getText(transferConfirmationTypeLabel), 'Type');
      expect(await driver.getText(transferConfirmationTypeField), 'Transfer');
    });

    test(
        'TransferFundsScreen, navigating back from TransferConfirmation screen by pushing Make another transfer button',
        () async {
      await driver.tap(anotherTransferButton);
      await driver.waitForAbsent(anotherTransferButton);
      expect(await driver.getText(transferFundsBarTitle), 'Transfer Funds');
    });

    test('TransferFundsScreen, check transfer form was reset', () async {
      DateTime now = DateTime.now();
      String date = '${now.month}/${now.day}/${now.year}';
      await driver.waitFor(find.text('Select a From Account'));
      await driver.waitFor(find.text('Select a To Account'));
      expect(await driver.getText(amountTextField), '');
      expect(await driver.getText(dateTextField), date);
    });

    test(
        'CashAccountScreen, navigating back from TransferFundsScreen, check to find correct app bar',
        () async {
      await driver.tap(find.pageBack());
      await driver.waitForAbsent(transferFundsBarTitle);
      expect(await driver.getText(cashAccountAppBar), 'Business Banking');
    });
    */
  });
}
