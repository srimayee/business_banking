import 'package:business_banking/features/budget/bloc/budget_bloc.dart';
import 'package:business_banking/features/budget/ui/budget_feature_events.dart';
import 'package:business_banking/routes.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';

class BudgetFeatureActions {
  BudgetBloc bloc;

  BudgetFeatureActions({required this.bloc});

  void selectCategory(String value, BuildContext context) {
    bloc.budgetEvent.send(ApplyFilter(value));
    Navigator.pop(context);
  }

  void pushViewChart(BuildContext context, int rowIndex) {
    bloc.budgetEvent.send(SelectAccount(rowIndex));
    CFRouterScope.of(context).push(BusinessBankingRouter.viewBudgetChartRoute);
  }
}
