import 'dart:async';
import 'package:business_banking/features/card_usage/bloc/card_summary_bloc.dart';
import 'package:business_banking/features/card_usage/model/card_summary_view_model.dart';
import 'package:business_banking/features/card_usage/ui/transaction_bar_chart/transaction_bar_chart_screen.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CardSummaryChartPresenter extends Presenter<CardSummaryBloc,
    CardSummaryViewModel, CardSummaryBarChartScreen> {
  @override
  Stream<CardSummaryViewModel> getViewModelStream(CardSummaryBloc bloc) {
    return bloc.transactionDetailsViewModelPipe.receive;
  }

  @override
  CardSummaryBarChartScreen buildScreen(BuildContext context,
      CardSummaryBloc bloc, CardSummaryViewModel viewModel) {
    return CardSummaryBarChartScreen(
      viewModel: viewModel,
      navigateToHubScreen: () => _navigateToHubScreen(context),
    );
  }

  void _navigateToHubScreen(BuildContext context) {
    CFRouterScope.of(context).pop();
  }
}
