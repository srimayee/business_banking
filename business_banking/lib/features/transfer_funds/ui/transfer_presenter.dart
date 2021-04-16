import 'package:business_banking/features/transfer_funds/bloc/transfer_bloc.dart';
import 'package:business_banking/features/transfer_funds/enums.dart';
import 'package:business_banking/features/transfer_funds/model/transfer_view_model.dart';
import 'package:business_banking/features/transfer_funds/ui/transfer_screen_widgets/transfer_funds_screen.dart';
import 'package:business_banking/routes.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class TransferFundsPresenter extends Presenter<TransferFundsBloc,
    TransferFundsViewModel, TransferFundsScreen> {
  @override
  TransferFundsScreen buildScreen(BuildContext context, TransferFundsBloc bloc,
      TransferFundsViewModel viewModel) {
    SchedulerBinding.instance!.addPostFrameCallback((timeStamp) {
      if (viewModel.serviceStatus == ServiceStatus.success &&
          viewModel.dataStatus == DataStatus.valid) {
        _navigateToConfirmationScreen(context);
      } else if (viewModel.serviceStatus == ServiceStatus.fail) {
        _showErrorDialog(context, bloc);
      }
    });

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
        },
        onTapSubmit: () {
          _onTapSubmit(context, bloc, viewModel);
        });
  }

  @override
  Stream<TransferFundsViewModel> getViewModelStream(TransferFundsBloc bloc) {
    return bloc.transferFundsViewModelPipe.receive;
  }

  void _onChangeSelectedFromAccount(
      TransferFundsBloc bloc, String selectedFromAccount) {
    bloc.fromAccountPipe.send(selectedFromAccount);
  }

  void _onChangeSelectedToAccount(
      TransferFundsBloc bloc, String selectedToAccount) {
    bloc.toAccountPipe.send(selectedToAccount);
  }

  void _onChangeAmount(TransferFundsBloc bloc, String amountString) {
    double? amount = double.tryParse(amountString);
    if (amountString == '' || (amount != null && amount > 0)) {
      bloc.amountPipe.send(amountString);
    }
  }

  void _onChangeDate(TransferFundsBloc bloc, DateTime date) {
    bloc.datePipe.send(date);
  }

  void _onTapSubmit(BuildContext context, TransferFundsBloc bloc,
      TransferFundsViewModel viewModel) {
    if (viewModel.dataStatus == DataStatus.valid) {
      bloc.submitPipe.launch();
    } else {
      _showInvalidDataDialog(context);
    }
  }

  void _navigateToConfirmationScreen(BuildContext context) {
    CFRouterScope.of(context)
        .replaceWith(BusinessBankingRouter.transferFundsConfirmRoute);
  }

  void _showErrorDialog(BuildContext context, TransferFundsBloc bloc) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text('Error'),
        content: Text('Submit Failed'),
        actions: <Widget>[
          FlatButton(
            onPressed: () {
              bloc.resetServiceStatusPipe.launch();
              CFRouterScope.of(context).pop();
            },
            child: Text('OK'),
          )
        ],
      ),
    );
  }

  void _showInvalidDataDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text('Invalid'),
        content: Text('Please fill all transfer fields.'),
        actions: <Widget>[
          FlatButton(
            onPressed: () {
              CFRouterScope.of(context).pop();
            },
            child: Text('OK'),
          )
        ],
      ),
    );
  }
}
