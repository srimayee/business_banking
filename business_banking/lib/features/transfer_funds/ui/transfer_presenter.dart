import 'package:business_banking/features/transfer_funds/bloc/transfer_bloc.dart';
import 'package:business_banking/features/transfer_funds/model/transfer_view_model.dart';
import 'package:business_banking/features/transfer_funds/ui/tansfer_screen_widgets/transfer_funds_screen.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';

class TransferFundsPresenter extends Presenter<TransferFundsBloc,
    TransferFundsViewModel, TransferFundsScreen> {

  @override
  TransferFundsScreen buildScreen(BuildContext context, TransferFundsBloc bloc,
      TransferFundsViewModel viewModel) {
    return TransferFundsScreen(
        viewModel: viewModel,
        onChangeSelectedFromAccount: (selectedFromAccount) {
          _onChangeSelectedFromAccount(bloc, selectedFromAccount);
        },
        onChangeSelectedToAccount: (selectedToAccount) {
          _onChangeSelectedToAccount(bloc, selectedToAccount);
        },
        onChangeAmount: (amount) {
          _onChangeAmount(bloc, amount);
        },
        onChangeDate: (date) {
          _onChangeDate(bloc, date);
        }
    );
  }

  @override
  Stream<TransferFundsViewModel> getViewModelStream(TransferFundsBloc bloc) {
    return bloc.transferFundsViewModelPipe.receive;
  }

  void _onChangeSelectedFromAccount(TransferFundsBloc bloc, String selectedFromAccount) {
    bloc.fromAccountPipe.send(selectedFromAccount);
  }

  void _onChangeSelectedToAccount(TransferFundsBloc bloc, String selectedToAccount) {
    bloc.toAccountPipe.send(selectedToAccount);
  }

  void _onChangeAmount(TransferFundsBloc bloc, String amount) {
    bloc.amountPipe.send(amount);
  }

  void _onChangeDate(TransferFundsBloc bloc, DateTime date) {
    bloc.datePipe.send(date);
  }
}