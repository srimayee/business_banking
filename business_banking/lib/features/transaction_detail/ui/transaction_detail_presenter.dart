import 'dart:async';
import 'package:business_banking/features/transaction_detail/bloc/transaction_details_bloc.dart';

import 'package:business_banking/features/transaction_detail/model/transaction_details_view_model.dart';
import 'package:business_banking/features/transaction_detail/ui/transaction_detail_screen.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TransactionDetailPresenter extends Presenter<TransactionDetailsBloc,
    TransactionDetailsViewModel, TransactionDetailScreen> {
  @override
  Stream<TransactionDetailsViewModel> getViewModelStream(
      TransactionDetailsBloc bloc) {
    return bloc.transactionDetailsViewModelPipe.receive;
  }

  @override
  TransactionDetailScreen buildScreen(BuildContext context,
      TransactionDetailsBloc bloc, TransactionDetailsViewModel viewModel) {
    return TransactionDetailScreen(
      viewModel: viewModel,
      navigateToTransactionDetail: () {
        _navigateToTransactionDetail(context);
      },
    );
  }

  void _navigateToTransactionDetail(BuildContext context) {
    //CFRouterScope.of(context).push(BusinessBankingRouter.accountDetailRoute);
  }
}
