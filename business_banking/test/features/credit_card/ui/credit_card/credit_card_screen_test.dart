// @dart=2.9

import 'package:business_banking/features/credit_card/model/credit_card_view_model.dart';
import 'package:business_banking/features/credit_card/ui/credit_card/credit_card_actions.dart';
import 'package:business_banking/features/credit_card/ui/credit_card/credit_card_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/intl.dart';
import 'package:mockito/mockito.dart';

class CreditCardActionsMock extends Mock implements CreditCardActions {}

void main() {

  CreditCardViewModel viewModel;
  CreditCardActionsMock actions;
  Widget testWidget;

  setUp(() {
    viewModel = CreditCardViewModel(
      number: '1111222233334444',
      name: 'My Credit Card',
      lastFour: '4444',
      balance: 1234.56,
    );
    actions = CreditCardActionsMock();
    testWidget = MaterialApp(
      home: CreditCardScreen(
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

  testWidgets('CreditCardScreen initialization', (tester) async {
    await tester.pumpWidget(testWidget);
    await tester.pump(Duration(milliseconds: 500));
    expect(find.byType(CreditCardScreen), findsOneWidget);
  });

  testWidgets('CreditCardScreen viewModel values x screen values',
        (tester) async {

      await tester.pumpWidget(testWidget);
      await tester.pump(Duration(milliseconds: 500));

      /// name
      expect(find.text(viewModel.name), findsOneWidget);

      /// lastFour
      expect(find.text('*' + viewModel.lastFour), findsOneWidget);

      /// balance
      expect(find.text(NumberFormat.simpleCurrency().format(viewModel.balance)), findsOneWidget);
    });

  testWidgets('CreditCardScreen actions',
      (tester) async {

    await tester.pumpWidget(testWidget);
    await tester.pump(Duration(milliseconds: 500));

    /// navigateToCreditCardDetails
    var widget = find.byKey(Key('creditCardCard'));
    expect(widget, findsOneWidget);
    await tester.tap(widget);
    verify(actions.navigateToCreditCardDetails(any, any)).called(1);

  });
}
