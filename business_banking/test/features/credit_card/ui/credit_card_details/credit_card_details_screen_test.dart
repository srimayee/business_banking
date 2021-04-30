// @dart=2.9
import 'package:business_banking/features/credit_card/model/credit_card_view_model.dart';
import 'package:business_banking/features/credit_card/ui/credit_card_details/credit_card_details_actions.dart';
import 'package:business_banking/features/credit_card/ui/credit_card_details/credit_card_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/intl.dart';
import 'package:mockito/mockito.dart';

class CreditCardDetailsActionsMock extends Mock  implements CreditCardDetailsActions {}

void main() {
  CreditCardViewModel viewModel;
  CreditCardDetailsActionsMock actions;
  Widget testWidget;

  setUp(() {
    List<CreditCardTransaction> transactions = List.empty(growable: true);
    transactions.add(CreditCardTransaction(
        id: "1",
        name: "Transaction #1",
        date: DateTime.parse("2021-04-18"),
        value: 45.00));
    transactions.add(CreditCardTransaction(
        id: "2",
        name: "Transaction #2",
        date: DateTime.parse("2021-04-17"),
        value: 25.00));
    transactions.add(CreditCardTransaction(
        id: "3",
        name: "Transaction #3",
        date: DateTime.parse("2021-04-15"),
        value: 60.00));
    transactions.add(CreditCardTransaction(
        id: "4",
        name: "Transaction #4",
        date: DateTime.parse("2021-04-11"),
        value: 40.00));
    viewModel = CreditCardViewModel(
        number: '1111222233334444',
        name: 'My Credit Card',
        lastFour: '4444',
        balance: 1234.56,
        paymentDueDate: DateTime.parse("2021-05-03"),
        nextClosingDate: DateTime.parse("2021-05-06"),
        paymentMinimumValue: 100.00,
        transactions: transactions);

    actions = CreditCardDetailsActionsMock();
    testWidget = MaterialApp(
      home: CreditCardDetailsScreen(
        viewModel: viewModel,
        actions: actions,
      ),
    );
  });

  tearDown(() {
    viewModel = null;
    actions = null;
    testWidget = null;
  });

  testWidgets('CreditCardDetailsScreen initialization', (tester) async {
    await tester.pumpWidget(testWidget);
    await tester.pump(Duration(milliseconds: 500));
    expect(find.byType(CreditCardDetailsScreen), findsOneWidget);
  });

  testWidgets('CreditCardDetailsScreen viewModel values x screen values',
      (tester) async {
    await tester.pumpWidget(testWidget);
    await tester.pump(Duration(milliseconds: 500));

    /// lastFour
    expect(find.text('*' + viewModel.lastFour), findsOneWidget);

    /// name
    expect(find.text(viewModel.name), findsOneWidget);

    /// balance
    expect(find.text(NumberFormat.simpleCurrency().format(viewModel.balance)),
        findsOneWidget);

    /// Pay Button
    expect(find.text("Pay"), findsOneWidget);

    /// transactions
    for(int i = 0; i < viewModel.transactions.length; i++) {
      expect(find.text(viewModel.transactions[i].name), findsOneWidget);
      expect(find.text(NumberFormat.simpleCurrency().format(viewModel.transactions[i].value)), findsOneWidget);
      expect(find.text(DateFormat.MMMd().format(viewModel.transactions[i].date)), findsOneWidget);
    }

  });

  testWidgets('CreditCardDetailsScreen actions', (tester) async {
    await tester.pumpWidget(testWidget);
    await tester.pump(Duration(milliseconds: 500));

    /// navigateBack
    var widget = find.byKey(Key('backButton'));
    expect(widget, findsOneWidget);
    await tester.tap(widget);
    verify(actions.navigateBack(any)).called(1);

    /// navigateToPayment
    widget = find.byKey(Key('payButton'));
    expect(widget, findsOneWidget);
    await tester.tap(widget);
    verify(actions.pressPayButton(any)).called(1);

  });
}
