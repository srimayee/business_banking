import 'package:business_banking/features/transfer_funds/bloc/transfer_bloc.dart';
import 'package:business_banking/features/transfer_funds/model/transfer_confirmation_view_model.dart';
import 'package:business_banking/features/transfer_funds/ui/confirmation/transfer_confirmation_screen.dart';
import 'package:business_banking/features/transfer_funds/ui/loading_screen.dart';
import 'package:business_banking/features/transfer_funds/ui/transfer_widget.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';

class TransferConfirmationPresenter extends Presenter<TransferFundsBloc,
    TransferConfirmationViewModel, TransferConfirmationScreen> {
  @override
  Stream<TransferConfirmationViewModel> getViewModelStream(
      TransferFundsBloc bloc) {
    return bloc.confirmationViewModelPipe.receive;
  }

  @override
  TransferConfirmationScreen buildScreen(BuildContext context,
      TransferFundsBloc bloc, TransferConfirmationViewModel viewModel) {
    return TransferConfirmationScreen(
      viewModel: viewModel,
      navigateToTransferScreen: () => _navigateToTransferScreen(context, bloc),
    );
  }

  @override
  Widget buildLoadingScreen(BuildContext context) {
    return LoadingScreen('Transfer Confirmation');
  }

  void _navigateToTransferScreen(
      BuildContext context, TransferFundsBloc bloc) {
    bloc.resetViewModelPipe.launch();
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            maintainState: false,
            settings: RouteSettings(name: 'TransferScreen'),
            builder: (context) => TransferFundsWidget()));
  }
}
