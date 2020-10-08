import 'package:business_banking/features/transfer_funds/bloc/transfer_bloc.dart';
import 'package:business_banking/features/transfer_funds/enums.dart';
import 'package:business_banking/features/transfer_funds/model/transfer_view_model.dart';
import 'package:business_banking/features/transfer_funds/ui/confirmation/transfer_confirmation_widget.dart';
import 'package:business_banking/features/transfer_funds/ui/tansfer_screen_widgets/transfer_funds_screen.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class TransferFundsPresenter extends Presenter<TransferFundsBloc,
    TransferFundsViewModel, TransferFundsScreen> {

  @override
  TransferFundsScreen buildScreen(BuildContext context, TransferFundsBloc bloc,
      TransferFundsViewModel viewModel) {
    print('TransferFundsPresenter buildScreen is called');
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      if (viewModel.serviceStatus == ServiceStatus.fail) {
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
        () { _onTapSubmit(context, viewModel); }
    );
  }


  @override
  Widget buildLoadingScreen(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Transfer funds'),
        backgroundColor: Colors.green,
      ),
      body: Center(child: CircularProgressIndicator(backgroundColor: Colors.green,)),
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

  void _onTapSubmit(BuildContext context, TransferFundsViewModel viewModel) {
    if (viewModel.fromAccount != null && viewModel.toAccount != null && viewModel.amount > 0) {
      _navigateToConfirmationScreen(context);
      // _navigateToAccountDetail(context);
    }
    else {
      _showInvalidDataDialog(context);
    }
  }

  void _navigateToConfirmationScreen(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
          settings: RouteSettings(name: 'TransferConfirmationScreen'),
          // builder: (context) => TransferConfirmationScreen(viewModel)
          builder: (context) => TransferFundsConfirmationWidget()
      )
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