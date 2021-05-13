import 'package:business_banking/features/bill_pay/bloc/form_screen/bill_pay_event.dart';
import 'package:business_banking/features/bill_pay/bloc/bill_pay_bloc.dart';
import 'package:business_banking/features/bill_pay/model/form_screen/bill_pay_view_model.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';

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
    return BillPayScreen(
      viewModel: viewModel,
      presenterActions: BillPayPresenterActions(
        bloc,
      ),
    );
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

  /// listens action on Confirm Button
  void onTapConfirmBtn(BuildContext context, BillPayViewModel viewModel) {
    if (viewModel.selectedBillIndex != null) {
      bloc.billPayEventPipe.send(PayButtonClickEvent());

    } else {
      assert(false); //The confirm button can't be clicked if no bill is selected, so this should never happen
      showErrorDialog(context);
    }
  }

  void showErrorDialog(BuildContext context,
      {String title = 'Invalid', String msg = 'Please select a bill.'}) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(title),
        content: Text(msg),
        actions: <Widget>[
          TextButton(
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
