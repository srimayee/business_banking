import 'package:business_banking/features/card_usage/model/card_summary_model.dart';
import 'package:business_banking/features/card_usage/ui/card_summary_tile.dart';
import 'package:flutter/material.dart';

import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('TransactionTile', (tester) async {
    final testWidget = MaterialApp(
        home: Scaffold(
            body: CardTransactionTile(
      viewModel: CardSummaryModel(
          debit: true,
          transactionAmount: 200.23,
          transactionTitle: 'Gas Station',
          transactionId: '0000006',
          transactionCategory: 'gas',
          payTo: "Merchant6",
          date: DateTime.fromMillisecondsSinceEpoch(1618237756 * 1000)),
    )));
    await tester.pumpWidget(testWidget);
    await tester.pump(Duration(milliseconds: 500));

    expect(find.widgetWithText(CardTransactionTile, "Gas Station"), findsOneWidget);
    expect(find.widgetWithText(CardTransactionTile, "Gas"), findsOneWidget);
    expect(find.widgetWithText(CardTransactionTile, "\$200.23"), findsOneWidget);
    expect(find.widgetWithText(CardTransactionTile, "04/12/2021"), findsOneWidget);
    expect(find.byType(CardTransactionTile), findsOneWidget);
  });
}
