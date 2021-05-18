import 'package:business_banking/features/card_usage/bloc/card_summary_bloc.dart';
import 'package:business_banking/features/card_usage/model/card_summary_view_model.dart';
import 'package:business_banking/features/card_usage/ui/transaction_bar_chart/bar_chart.dart';
import 'package:business_banking/features/card_usage/ui/transaction_bar_chart/transaction_bar_chart_presenter.dart';
import 'package:business_banking/features/card_usage/ui/transaction_bar_chart/transaction_bar_chart_screen.dart';
import 'package:business_banking/features/card_usage/ui/transaction_bar_chart/transaction_bar_chart_widget.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';


void main() {
  testWidgets('TransactionBarChartWidget, with true bloc', (tester) async {
    final testWidget = MaterialApp(
        home: BlocProvider<CardSummaryBloc>(
      child: TransactionBarChartWidget(),
      create: (_) => CardSummaryBloc(),
    ));

    await tester.pumpWidget(testWidget);
    await tester.pump(Duration(milliseconds: 500));

    expect(find.byType(CardSummaryChartPresenter), findsOneWidget);
  });

    testWidgets('Transactions, with true bloc', (tester) async {
       VoidCallback navigateToHubScreen;
      // navigateToHubScreen() {}
      final testWidget = MaterialApp(
        home: BlocProvider<CardSummaryBloc>(
          create: (_) => CardSummaryBloc(),
          child: CardSummaryBarChartScreen(
            viewModel: CardSummaryViewModel(cardTransactions: []), navigateToHubScreen: () {  },
            // navigateToHubScreen: navigateToHubScreen(),
          ),
        ),
      );

      await tester.pumpWidget(testWidget);
      await tester.pump(Duration(milliseconds: 500));

      expect(find.byType(CardSummaryBarChartScreen), findsOneWidget);
    });

  }

