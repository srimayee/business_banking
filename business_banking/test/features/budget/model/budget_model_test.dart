// @dart=2.9

import 'package:business_banking/features/budget/model/account_info.dart';
import 'package:business_banking/features/budget/model/budget_view_model.dart';
import 'package:business_banking/features/budget/model/chart_data_model.dart';
import 'package:business_banking/features/budget/model/posted_transactions.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:charts_flutter/flutter.dart' as charts;

void main() {
  List<charts.Series<ChartDataModel, int>> _createSampleChartData() {
    final data = [
      new ChartDataModel(
          0, 5, '', charts.MaterialPalette.red.shadeDefault.lighter),
    ];

    return [
      new charts.Series<ChartDataModel, int>(
        id: 'Sales',
        domainFn: (ChartDataModel model, _) => model.segmentIndex,
        measureFn: (ChartDataModel model, _) => model.segmentTotal,
        data: data,
        // Set a label accessor to control the text of the arc label.
        labelAccessorFn: (ChartDataModel row, _) => '${row.segmentTotal}',
      )
    ];
  }

  var _chartData;

  setUpAll(() async {
    _chartData = _createSampleChartData();
  });

  tearDownAll(() async {
    if (_chartData != null) {
      _chartData = null;
    }
  });

  test('MODEL TEST: On success BudgetViewModel should initialize.', () async {
    final _postedTxns = PostedTransactions('2021-04-04T19:00:03Z',
        'SUNRISE MINI MART', 2.00, 'Wholesale Clubs', 'xxxx-xxxx-xxxx-6917');
    final viewModel = BudgetViewModel(
        accountInfo: AccountInfo('1234567890', 1.00, 'Account Nickname'),
        accounts: [AccountInfo('1234567890', 1.00, 'Account Nickname')],
        allTransactions: [_postedTxns],
        filteredTransactions: [_postedTxns],
        chartData: _chartData,
        serviceStatus: TransactionsServiceStatus.success);
    expect(viewModel.props, [
      viewModel.accountInfo,
      viewModel.accounts,
      viewModel.allTransactions,
      viewModel.filteredTransactions,
      viewModel.chartData,
      viewModel.serviceStatus
    ]);

    expect(viewModel.stringify, true);
    expect(viewModel.accountInfo.accountNumber, '1234567890');
    expect(viewModel.accountInfo.availableBalance, 1.00);
    expect(viewModel.accountInfo.accountNickname, 'Account Nickname');
    expect(viewModel.allTransactions.length, 1);
    expect(viewModel.allTransactions.first.transactionDate,
        '2021-04-04T19:00:03Z');
    expect(viewModel.allTransactions.first.description, 'SUNRISE MINI MART');
    expect(viewModel.allTransactions.first.category, 'Wholesale Clubs');
    expect(viewModel.allTransactions.first.debitAmount, 2.00);
    expect(viewModel.allTransactions.first.cardNumber, 'xxxx-xxxx-xxxx-6917');
  });
}
