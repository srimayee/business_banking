import 'package:business_banking/features/bill_pay/bloc/form_screen/bill_pay_event.dart';
import 'package:business_banking/features/bill_pay/bloc/bill_pay_bloc.dart';
import 'package:business_banking/features/bill_pay/model/bill.dart';
import 'package:business_banking/features/bill_pay/model/enums.dart';
import 'package:business_banking/features/bill_pay/model/form_screen/bill_pay_view_model.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import '../../../../routes.dart';
import 'bill_pay_screen.dart';

class BillPayPresenter extends Presenter<BillPayBloc,
    BillPayViewModel, BillPayScreen> {
  @override
  Stream<BillPayViewModel> getViewModelStream(BillPayBloc bloc) {
    return bloc.billPayViewModelPipe.receive;
  }

  @override
  BillPayScreen buildScreen(BuildContext context, BillPayBloc bloc,
      BillPayViewModel viewModel) {
    BillPayPresenterActions presenterActions
      = BillPayPresenterActions(bloc);

    SchedulerBinding.instance!.addPostFrameCallback((timeStamp) {
      if (viewModel.payStatus == PayBillStatus.success) {
        _showBillPaySuccessDialog(context, viewModel, presenterActions);
      } else if (viewModel.payStatus == PayBillStatus.failed) {
        _showBillPayFailedDialog(context, presenterActions);
      }
    });
    return BillPayScreen(
      viewModel: viewModel,
      presenterActions: presenterActions
    );
  }

  void _showBillPaySuccessDialog(BuildContext context,
      BillPayViewModel viewModel,
      BillPayPresenterActions presenterActions) {
    Bill bill = viewModel.allBills[viewModel.selectedBillIndex];
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: Text('Success'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('You successfully paid '
                  '\$${bill.amount.toStringAsFixed(2)} to ${bill.payee}!'),
              Text('Reference number: ${viewModel.referenceNumber}')
            ],
          ),
          actions: <Widget>[
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  presenterActions.confirmBillPayed();
                },
                child: Text('Pay another')),
            TextButton(
                onPressed: () {
                  presenterActions.confirmBillPayed();
                  presenterActions.popNavigationListener(context);
                },
                child: Text('Back to hub'))
          ],
        )
    );
  }

  void _showBillPayFailedDialog(BuildContext context,
      BillPayPresenterActions presenterActions) {
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: Text('Error'),
          content: Text('Unable to pay the bill, please try again later.'),
          actions: <Widget>[
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  presenterActions.confirmBillPayed();
                },
                child: Text('Back'))
          ],
        ));
  }
}

class BillPayPresenterActions {
  BillPayBloc bloc;

  BillPayPresenterActions(this.bloc);

  popNavigationListener(BuildContext context) {
    CFRouterScope.of(context).pop();
  }

  /// listens select bill action
  onBillSelectedListener(int selectedBillIndex) {
    bloc.billPayEventPipe.send(SelectBillEvent(selectedBillIndex));
  }

  /// resets billPayStatus
  confirmBillPayed() {
    bloc.billPayEventPipe.send(ConfirmBillPayedEvent());
  }

  /// listens tap on Confirm Button
  void onTapConfirmBtn(BuildContext context, BillPayViewModel viewModel) {
    if (viewModel.selectedBillIndex != null) {
      bloc.billPayEventPipe.send(PayButtonClickEvent());
    }
  }
}
