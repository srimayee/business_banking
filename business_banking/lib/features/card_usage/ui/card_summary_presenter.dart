import 'dart:async';
import 'package:business_banking/features/card_usage/bloc/card_summary_bloc.dart';
import 'package:business_banking/features/card_usage/model/card_summary_view_model.dart';
import 'package:business_banking/features/card_usage/ui/card_transaction_screen.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CardSummaryPresenter extends Presenter<CardSummaryBloc,
    CardSummaryViewModel, CardTransactionScreen> {
  @override
  Stream<CardSummaryViewModel> getViewModelStream(CardSummaryBloc bloc) {
    return bloc.transactionDetailsViewModelPipe.receive;
  }

  @override
  CardTransactionScreen buildScreen(BuildContext context, CardSummaryBloc bloc,
      CardSummaryViewModel viewModel) {
    return CardTransactionScreen(viewModel: viewModel);
  }
}
