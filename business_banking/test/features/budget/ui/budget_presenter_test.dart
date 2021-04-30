// @dart=2.9

import 'package:business_banking/features/budget/bloc/budget_bloc.dart';
import 'package:business_banking/features/budget/ui/chart/view_chart_presenter.dart';
import 'package:business_banking/features/budget/ui/chart/view_chart_widget.dart';
import 'package:business_banking/features/budget/ui/first_card/budget_presenter.dart';
import 'package:business_banking/features/budget/ui/first_card/budget_widget.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('UI TEST: should add BudgetPresenter to widget tree',
      (tester) async {
    final testWidget = MaterialApp(
      home: BlocProvider<BudgetBloc>(
          child: BudgetWidget(), create: (_) => BudgetBloc()),
    );

    await tester.pumpWidget(testWidget);
    await tester.pumpAndSettle();

    expect(find.byType(BudgetPresenter), findsOneWidget);
  });

  testWidgets('UI TEST: should add ViewChartPresenter to widget tree',
      (tester) async {
    final testWidget = MaterialApp(
      home: BlocProvider<BudgetBloc>(
          child: ViewChartWidget(), create: (_) => BudgetBloc()),
    );

    await tester.pumpWidget(testWidget);
    await tester.pumpAndSettle();

    expect(find.byType(ViewChartPresenter), findsOneWidget);
  });
}
