import 'dart:async';
import 'package:business_banking/features/transaction/bloc/transaction_details_bloc.dart';
import 'package:business_banking/features/transaction/model/transaction_details_view_model.dart';
import 'package:business_banking/features/transaction/ui/transaction_details_screen.dart';
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
    return TransactionDetailScreen(viewModel: viewModel);
  }
}
