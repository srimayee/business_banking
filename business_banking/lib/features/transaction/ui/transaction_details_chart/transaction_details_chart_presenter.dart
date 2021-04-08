import 'dart:async';
import 'package:business_banking/features/transaction/bloc/transaction_details_bloc.dart';
import 'package:business_banking/features/transaction/model/transaction_details_view_model.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'transaction_details_chart_screen.dart';

class TransactionDetailsChartPresenter extends Presenter<TransactionDetailsBloc,
    TransactionDetailsViewModel, TransactionDetailsChartScreen> {
  @override
  Stream<TransactionDetailsViewModel> getViewModelStream(
      TransactionDetailsBloc bloc) {
    return bloc.transactionDetailsViewModelPipe.receive;
  }

  @override
  TransactionDetailsChartScreen buildScreen(BuildContext context,
      TransactionDetailsBloc bloc, TransactionDetailsViewModel viewModel) {
    return TransactionDetailsChartScreen(
      viewModel: viewModel,
      navigateToHubScreen: () => _navigateToHubScreen(context),
    );
  }

  void _navigateToHubScreen(BuildContext context) {
    CFRouterScope.of(context).pop();
  }
}
