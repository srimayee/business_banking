import 'package:business_banking/features/transaction/model/transaction_model.dart';
import 'package:business_banking/features/transaction/ui/transaction_tile.dart';
import 'package:flutter/material.dart';

import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('TransactionTile', (tester) async {
    final testWidget = MaterialApp(
        home: Scaffold(
            body: TransactionTile(
      viewModel: TransactionModel(
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
    expect(find.widgetWithText(TransactionTile, "Gas Station"), findsOneWidget);
    expect(find.byType(TransactionTile), findsOneWidget);
  });
}
