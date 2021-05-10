import 'dart:async';
import 'package:business_banking/features/card_usage/bloc/card_summary_bloc.dart';
import 'package:business_banking/features/card_usage/model/card_summary_view_model.dart';
import 'package:business_banking/features/card_usage/ui/transaction_bar_chart/transaction_bar_chart_screen.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TransactionBarChartPresenter extends Presenter<CardSummaryBloc,
    CardSummaryViewModel, TransactionBarChartScreen> {
  @override
  Stream<CardSummaryViewModel> getViewModelStream(CardSummaryBloc bloc) {
    return bloc.transactionDetailsViewModelPipe.receive;
  }

  @override
  TransactionBarChartScreen buildScreen(BuildContext context,
      CardSummaryBloc bloc, CardSummaryViewModel viewModel) {
    return TransactionBarChartScreen(
      viewModel: viewModel,
      navigateToHubScreen: () => _navigateToHubScreen(context),
    );
  }

  void _navigateToHubScreen(BuildContext context) {
    CFRouterScope.of(context).pop();
  }
}
