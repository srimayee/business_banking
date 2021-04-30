import 'package:business_banking/features/budget/bloc/budget_bloc.dart';
import 'package:business_banking/features/budget/model/budget_view_model.dart';
import 'package:business_banking/features/budget/ui/budget_feature_actions.dart';
import 'package:business_banking/features/budget/ui/chart/view_chart_screen.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';

class ViewChartPresenter
    extends Presenter<BudgetBloc, BudgetViewModel, ViewChartScreen> {
  @override
  ViewChartScreen buildScreen(
      BuildContext context, BudgetBloc bloc, BudgetViewModel viewModel) {
    // implement buildScreen
    final myActions = BudgetFeatureActions(bloc: bloc);
    return ViewChartScreen(
      viewModel: viewModel,
      actions: myActions,
    );
  }

  @override
  Stream<BudgetViewModel> getViewModelStream(BudgetBloc bloc) {
    // implement getViewModelStream
    return bloc.budgetChartViewModelPipe.receive;
  }

  @override
  Widget buildLoadingScreen(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}
