import 'dart:typed_data';

import 'package:business_banking/dependency/share_files.dart';
import 'package:business_banking/features/budget/bloc/budget_bloc.dart';
import 'package:business_banking/routes.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';

class BudgetFeatureActions {
  BudgetBloc bloc;

  BudgetFeatureActions({required this.bloc});

  void selectCategory(String value, BuildContext context) {
    bloc.chosenCategoryPipe.send(value);
    Navigator.pop(context);
  }

  void pushViewChart(BuildContext context, int rowIndex) {
    bloc.selectedRowIndexPipe.send(rowIndex);
    CFRouterScope.of(context).push(BusinessBankingRouter.viewBudgetChartRoute);
  }

  void shareChart(BuildContext context, Uint8List data) async {
    String path = await bloc.shareChart(data);
    ShareFiles.shareFile(context, path);
  }
}