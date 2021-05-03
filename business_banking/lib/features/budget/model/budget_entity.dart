import 'package:business_banking/features/budget/model/budget_view_model.dart';
import 'package:business_banking/features/budget/model/chart_data_model.dart';
import 'package:business_banking/features/budget/model/posted_transactions.dart';
import 'package:clean_framework/clean_framework.dart';

import 'account_info.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class BudgetEntity extends Entity {
  final AccountInfo? accountInfo;
  final List<AccountInfo>? accounts;
  final List<PostedTransactions>? allTransactions;
  final List<PostedTransactions>? filteredTransactions;
  final List<charts.Series<ChartDataModel, int>> chartData;

  BudgetEntity(
      {List<EntityFailure> errors = const [],
      AccountInfo? accountInfo,
      List<AccountInfo>? accounts,
      List<PostedTransactions>? allTransactions,
      List<PostedTransactions>? filteredTransactions,
      List<charts.Series<ChartDataModel, int>> chartData = const []})
      : accountInfo = accountInfo,
        accounts = accounts ?? [],
        allTransactions = allTransactions ?? [],
        filteredTransactions = filteredTransactions ?? [],
        chartData = chartData,
        super(errors: errors);

  @override
  List<Object> get props => [errors, accountInfo!, accounts!, allTransactions!, chartData];

  @override
  BudgetEntity merge(
      {errors,
      AccountInfo? accountInfo,
      List<AccountInfo>? accounts,
      List<PostedTransactions>? allTransactions,
      List<PostedTransactions>? filteredTransactions,
      chartData}) {
    return BudgetEntity(
        errors: errors ?? this.errors,
        accountInfo: accountInfo ?? this.accountInfo,
        accounts: accounts ?? this.accounts,
        allTransactions: allTransactions ?? this.allTransactions,
        filteredTransactions: filteredTransactions ?? this.filteredTransactions,
        chartData: chartData ?? this.chartData);
  }

  List<PostedTransactions>? filterWith(String category) {
    if (category == 'Show All') {
      return allTransactions!;
    } else {
      return allTransactions!.where((i) => i.category == category).toList();
    }
  }

  AccountInfo selectedItem(int index) => accounts![index];
}
