// @dart=2.9
import 'package:business_banking/features/budget/ui/chart/view_chart_presenter.dart';
import 'package:business_banking/features/budget/ui/chart/view_chart_widget.dart';
import 'package:business_banking/features/budget/ui/first_card/budget_presenter.dart';
import 'package:business_banking/features/budget/ui/first_card/budget_widget.dart';
import 'package:business_banking/features/budget/ui/transactions_list/list_transactions_presenter.dart';
import 'package:business_banking/features/budget/ui/transactions_list/list_transactions_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('WIDGET TEST: Budget Widget loaded successfully!',
      (tester) async {
    final testWidget = MaterialApp(
      home: Scaffold(
        body: BudgetWidget(),
      ),
    );

    await tester.pumpWidget(testWidget);

    expect(find.byType(BudgetPresenter), findsOneWidget);
  });

  testWidgets('WIDGET TEST: ListTransactions Widget loaded successfully!',
      (tester) async {
    final testWidget = MaterialApp(
      home: Scaffold(
        body: ListTransactionsWidget(),
      ),
    );

    await tester.pumpWidget(testWidget);

    expect(find.byType(ListTransactionsPresenter), findsOneWidget);
  });

  testWidgets('WIDGET TEST: ViewChart Widget loaded successfully!',
      (tester) async {
    final testWidget = MaterialApp(
      home: Scaffold(
        body: ViewChartWidget(),
      ),
    );

    await tester.pumpWidget(testWidget);

    expect(find.byType(ViewChartPresenter), findsOneWidget);
  });
}
