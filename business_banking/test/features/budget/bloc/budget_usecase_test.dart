// @dart=2.9

import 'package:business_banking/features/budget/bloc/budget_usecase.dart';
import 'package:business_banking/features/budget/model/account_info.dart';
import 'package:business_banking/features/budget/model/budget_entity.dart';
import 'package:business_banking/features/budget/model/budget_view_model.dart';
import 'package:business_banking/features/budget/model/chart_data_model.dart';
import 'package:business_banking/features/budget/model/posted_transactions.dart';
import 'package:business_banking/locator.dart';
import 'package:charts_flutter/flutter.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  test('BudgetUsecase should publish BudgetViewModel stream', () async {
    BudgetUsecase useCase = BudgetUsecase((viewModel) {
      expect(viewModel, isA<BudgetViewModel>());
    });
    useCase.create();
  });

  test('BudgetUsecase should initialize and create BudgetEntity', () async {
    final entity = BudgetEntity(
        accountInfo: AccountInfo(
          '1234567890',
          1.00,
          'Account Nickname',
        ),
        allTransactions: [
          PostedTransactions(
            '2021-04-04T19:00:03Z',
            'SUNRISE MINI MART',
            2.00,
            'Wholesale Clubs',
            'xxxx-xxxx-xxxx-6917',
          )
        ]);

    ExampleLocator()
        .repository
        .create<BudgetEntity>(entity, (_) {}, deleteIfExists: true);
    await Future.delayed(Duration(milliseconds: 200));

    BudgetUsecase useCase = BudgetUsecase((viewModel) {
      final _scope = ExampleLocator().repository.containsScope<BudgetEntity>();
      final entity = ExampleLocator().repository.get<BudgetEntity>(_scope);
      expect(entity, isA<BudgetEntity>());
      expect(viewModel, isA<BudgetViewModel>());
    });
    useCase.create();
  });

  test('Merging BudgetEntity with chart data after updateViewModelWithChartData',
      () async {
    final _postedTxns = PostedTransactions('2021-04-04T19:00:03Z',
        'SUNRISE MINI MART', 2.00, 'Wholesale Clubs', 'xxxx-xxxx-xxxx-6917');

    final entity = BudgetEntity(
        accountInfo: AccountInfo('1234567890', 1.00, 'Account Nickname'),
        allTransactions: [_postedTxns]);

    ExampleLocator()
        .repository
        .create<BudgetEntity>(entity, (_) {}, deleteIfExists: true);
    await Future.delayed(Duration(milliseconds: 200));

    BudgetUsecase useCase = BudgetUsecase((viewModel) {
      expect(viewModel, isA<BudgetViewModel>());
    });
    useCase.create();

    useCase.updateViewModelWithChartData(entity).then((value) {
      expect(value, isA<BudgetEntity>());
      expect(value.chartData, isA<List<Series<ChartDataModel, int>>>());
    });
  });
}
