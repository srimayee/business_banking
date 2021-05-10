import 'package:business_banking/features/card_usage/bloc/card_summary_bloc.dart';
import 'package:business_banking/features/card_usage/model/card_summary_model.dart';
import 'package:business_banking/features/card_usage/model/card_summary_view_model.dart';
import 'package:business_banking/features/card_usage/ui/card_summary_presenter.dart';
import 'package:business_banking/features/card_usage/ui/card_transaction_screen.dart';
import 'package:business_banking/features/card_usage/ui/card_summary_tile.dart';
import 'package:business_banking/features/card_usage/ui/card_transaction_widget.dart';
import 'package:clean_framework/clean_framework.dart';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Transactions, with true bloc', (tester) async {
    final testWidget = MaterialApp(
      home: BlocProvider<CardSummaryBloc>(
        create: (_) => CardSummaryBloc(),
        child: CardTransactionWidget(),
      ),
    );

    await tester.pumpWidget(testWidget);
    await tester.pump(Duration(milliseconds: 500));

    expect(find.byType(CardSummaryPresenter), findsOneWidget);
  });

  testWidgets(
      'Given a TransactionViewModel, builds TransactionTile',
      (tester) async {
    CardSummaryViewModel transactionViewModel;

    transactionViewModel = CardSummaryViewModel(transactionDetails: [
      CardSummaryModel(
          debit: true,
          transactionAmount: 200.23,
          transactionTitle: 'Gas Station',
          transactionId: '0000006',
          transactionCategory: 'gas',
          payTo: "Merchant6",
          date: DateTime.fromMillisecondsSinceEpoch(1618237756 * 1000)),
    ]);

    final testWidget = MaterialApp(
      home: BlocProvider<CardSummaryBloc>(
        create: (_) => CardSummaryBloc(),
        child: Scaffold(
          body: CardTransactionScreen(
            viewModel: transactionViewModel,
          ),
          // body: TransactionTile(
          //   viewModel: transactionModel,
        ),
      ),
    );

    await tester.pumpWidget(testWidget);
    await tester.pump(Duration(milliseconds: 500));

    expect(find.byType(CardTransactionTile), findsOneWidget);
    expect(find.widgetWithText(CardTransactionTile, "Gas Station"), findsOneWidget);
    expect(find.widgetWithText(CardTransactionTile, "Gas"), findsOneWidget);
    expect(find.widgetWithText(CardTransactionTile, "\$200.23"), findsOneWidget);
    expect(find.widgetWithText(CardTransactionTile, "04/12/2021"), findsOneWidget);
  });
}
