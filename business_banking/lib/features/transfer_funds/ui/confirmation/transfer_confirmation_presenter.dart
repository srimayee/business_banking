import 'package:business_banking/features/transfer_funds/bloc/transfer_confirmation_bloc.dart';
import 'package:business_banking/features/transfer_funds/model/transfer_confirmation_view_model.dart';
import 'package:business_banking/features/transfer_funds/ui/confirmation/transfer_confirmation_screen.dart';
import 'package:business_banking/features/transfer_funds/ui/loading_screen.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';

class TransferConfirmationPresenter extends Presenter<TransferConfirmationBloc, TransferConfirmationViewModel, TransferConfirmationScreen> {

  @override
  Stream<TransferConfirmationViewModel> getViewModelStream(TransferConfirmationBloc bloc) {
    return bloc.viewModelPipe.receive;
  }

  @override
  TransferConfirmationScreen buildScreen(BuildContext context, TransferConfirmationBloc bloc, TransferConfirmationViewModel viewModel) {
    return TransferConfirmationScreen(viewModel);
  }

  @override
  Widget buildLoadingScreen(BuildContext context) {
    return LoadingScreen('Transfer Confirmation');
  }
}