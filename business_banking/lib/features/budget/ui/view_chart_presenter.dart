// import 'package:business_banking/features/budget/bloc/budget_bloc.dart';
// import 'package:business_banking/features/budget/model/budget_view_model.dart';
// import 'package:business_banking/features/budget/ui/view_chart_screen.dart';
// import 'package:clean_framework/clean_framework.dart';
// import 'package:flutter/material.dart';

// class ViewChartPresenter
//     extends Presenter<BudgetBloc, BudgetViewModel, ViewChartScreen> {
//   @override
//   ViewChartScreen buildScreen(
//       BuildContext context, BudgetBloc bloc, BudgetViewModel viewModel) {
//     // implement buildScreen
//     return ViewChartScreen(viewModel: viewModel);
//   }

//   @override
//   Stream<BudgetViewModel> getViewModelStream(BudgetBloc bloc) {
//     // implement getViewModelStream
//     return bloc.budgetViewModelPipe.receive;
//   }

//   @override
//   Widget buildLoadingScreen(BuildContext context) {
//     return Center(
//       child: CircularProgressIndicator(),
//     );
//   }
// }
