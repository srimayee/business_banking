import 'package:business_banking/features/transfer_funds/bloc/transfer_bloc.dart';
import 'package:business_banking/features/transfer_funds/enums.dart';
import 'package:business_banking/features/transfer_funds/model/transfer_view_model.dart';
import 'package:business_banking/features/transfer_funds/ui/confirmation/transfer_confirmation_widget.dart';
import 'package:business_banking/features/transfer_funds/ui/tansfer_screen_widgets/transfer_funds_screen.dart';
import 'package:business_banking/features/transfer_funds/ui/confirmation/transfer_confirmation_screen.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class TransferFundsPresenter extends Presenter<TransferFundsBloc,
    TransferFundsViewModel, TransferFundsScreen> {

  @override
  TransferFundsScreen buildScreen(BuildContext context, TransferFundsBloc bloc,
      TransferFundsViewModel viewModel) {
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      if (viewModel.id != null) {
        _navigateToConfirmationScreen(bloc, context, viewModel);
        return;
      } else if (viewModel.serviceStatus == ServiceStatus.fail) {
        _showErrorDialog(context);
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
        onTapSubmit:
            //() => _navigateToConfirmationScreen(bloc, context),
        () { _onTapSubmit(bloc); }
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

  void _onTapSubmit(TransferFundsBloc bloc) {
    bloc.submitPipe.launch();
  }

  void _navigateToConfirmationScreen(TransferFundsBloc bloc, BuildContext context, TransferFundsViewModel viewModel) {
    Navigator.pushReplacement(
      context,
      // MaterialPageRoute(
      //   settings: RouteSettings(name: 'TransferConfirmationScreen'),
      //   builder: (context) => TransferFundsConfirmationWidget(bloc),
      // ),
      MaterialPageRoute(
          settings: RouteSettings(name: 'TransferConfirmationScreen'),
          builder: (context) => TransferConfirmationScreen(viewModel))
    );
  }

  void _showErrorDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text('Error'),
        content: Text('Submit Failed'),
        actions: <Widget>[
          FlatButton(
            onPressed: () {
              Navigator.of(context).pop();
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
              Navigator.of(context).pop();
            },
            child: Text('OK'),
          )
        ],
      ),
    );
  }
}