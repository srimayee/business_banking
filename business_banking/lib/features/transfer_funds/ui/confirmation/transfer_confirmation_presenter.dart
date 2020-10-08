import 'package:business_banking/features/transfer_funds/bloc/transfer_confirmation_bloc.dart';
import 'package:business_banking/features/transfer_funds/model/transfer_confirmation_view_model.dart';
import 'package:business_banking/features/transfer_funds/ui/confirmation/transfer_confirmation_screen.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

class TransferConfirmationPresenter extends Presenter<TransferConfirmationBloc, TransferConfirmationViewModel, TransferConfirmationScreen> {

  @override
  Stream<TransferConfirmationViewModel> getViewModelStream(TransferConfirmationBloc bloc) {
    print('getViewModelStream in TransferConfirmationPresenter called');
    return bloc.viewModelPipe.receive;
  }

  @override
  TransferConfirmationScreen buildScreen(BuildContext context, TransferConfirmationBloc bloc, TransferConfirmationViewModel viewModel) {
    print('buildScreen in TransferConfirmationPresenter called');
    return TransferConfirmationScreen(viewModel);
  }

  @override
  Widget buildLoadingScreen(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transfer Confirmation'),
        backgroundColor: Colors.green,
      ),
      body: Center(child: CircularProgressIndicator(backgroundColor: Colors.green,)),
    );
  }
}