// @dart=2.9

import 'package:business_banking/features/budget/bloc/budget_bloc.dart';
import 'package:business_banking/features/budget/model/account_info.dart';
import 'package:business_banking/features/budget/model/budget_view_model.dart';
import 'package:business_banking/features/budget/model/posted_transactions.dart';
import 'package:business_banking/features/budget/ui/budget_feature_actions.dart';
import 'package:business_banking/features/budget/ui/chart/view_chart_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'budget_screen_test.dart';

class MockBudgetBloc extends Fake implements BudgetBloc {}

void main() {
  MockBudgetBloc bloc;

  setUpAll(() async {
    bloc = MockBudgetBloc();
  });

  tearDownAll(() async {
    bloc.dispose();
  });

  group('View Chart Screen tests', () {
    testWidgets('pumping ViewChartScreen with test data', (tester) async {
      final _postedTxns = PostedTransactions('2021-04-04T19:00:03Z',
          'SUNRISE MINI MART', 2.00, 'Wholesale Clubs', 'xxxx-xxxx-xxxx-6917');
      final viewModel = BudgetViewModel(
          accountInfo: AccountInfo('1234567890', 1.0, 'Account Nickname'),
          allTransactions: [_postedTxns],
          chartData: [], accounts: [], filteredTransactions: []);
      // final _myActions = BudgetFeatureActions(bloc: bloc);
      final mockActions = MockBudgetFeatureActions();

      final testWidget = MaterialApp(
          home: ViewChartScreen(
        viewModel: viewModel,
        actions: mockActions,
      ),
      );
      // await Future.delayed(Duration(milliseconds: 200));
      await tester.pumpWidget(testWidget);
      await tester.pumpAndSettle();
      expect(find.text("Select Category"), findsOneWidget);
    });
  });
}
