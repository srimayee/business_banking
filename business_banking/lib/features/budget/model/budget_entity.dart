import 'package:business_banking/features/budget/model/chart_data_model.dart';
import 'package:business_banking/features/budget/model/posted_transactions.dart';
import 'package:clean_framework/clean_framework.dart';

import 'account_info.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class BudgetEntity extends Entity {
  final AccountInfo? accountInfo;
  final List<PostedTransactions>? allTransactions;
  final List<charts.Series<ChartDataModel, int>> chartData;

  BudgetEntity(
      {List<EntityFailure> errors = const [],
      AccountInfo? accountInfo,
      List<PostedTransactions>? allTransactions,
      List<charts.Series<ChartDataModel, int>> chartData = const []})
      : accountInfo = accountInfo,
        allTransactions = allTransactions ?? [],
        chartData = chartData,
        super(errors: errors);

  // @override
  // List<Object> get props => [errors, accountInfo, allTransactions];

  @override
  BudgetEntity merge(
      {errors,
      AccountInfo? accountInfo,
      List<PostedTransactions>? allTransactions,
      chartData}) {
    return BudgetEntity(
        errors: errors ?? this.errors,
        accountInfo: accountInfo ?? this.accountInfo,
        allTransactions: allTransactions ?? this.allTransactions,
        chartData: chartData ?? this.chartData);
  }

  List<PostedTransactions>? filterWith(String category) {
    if (category == 'Show All') {
      return allTransactions!;
    } else {
      return allTransactions!.where((i) => i.category == category).toList();
    }
  }
}
