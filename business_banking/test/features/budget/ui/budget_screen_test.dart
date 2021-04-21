// @dart=2.9

import 'package:business_banking/features/budget/ui/budget_feature_actions.dart';
import 'package:business_banking/features/budget/model/account_info.dart';
import 'package:business_banking/features/budget/model/budget_view_model.dart';
import 'package:business_banking/features/budget/ui/first_card/budget_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockBudgetFeatureActions extends Mock implements BudgetFeatureActions {}

void main() {
  testWidgets('Budget Screen pumped with test data', (tester) async {
    final mockActions = MockBudgetFeatureActions();
    final viewModel = BudgetViewModel(
        accountInfo: AccountInfo('1234567890', 1.0, 'Account Nickname'),
        allTransactions: [],
        chartData: []);
    final testWidget = MaterialApp(
        home: BudgetScreen(
      viewModel: viewModel,
      actions: mockActions,
    ));
    await tester.pumpWidget(testWidget);
    await tester.pumpAndSettle();
    expect(find.byType(Text), findsNWidgets(5));
    expect(find.byType(OutlinedButton), findsNWidgets(1));
    expect(find.text("View Chart"), findsOneWidget);
    await tester.tap(find.byType(OutlinedButton));
  });
}
