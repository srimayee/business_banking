import 'package:business_banking/features/deposit_check/bloc/2nd_data_entry/deposit_check_event.dart';
import 'package:business_banking/features/deposit_check/bloc/deposit_check_bloc.dart';
import 'package:business_banking/features/deposit_check/model/2nd_data_entry/deposit_check_view_model.dart';
import 'package:business_banking/features/deposit_check/model/enums.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';

import '../../../../routes.dart';
import 'deposit_check_screen.dart';

class DepositCheckPresenter extends Presenter<DepositCheckBloc,
    DepositCheckViewModel, DepositCheckScreen> {
  @override
  Stream<DepositCheckViewModel> getViewModelStream(DepositCheckBloc bloc) {
    return bloc.depositCheckViewModelPipe.receive;
  }

  @override
  DepositCheckScreen buildScreen(BuildContext context, DepositCheckBloc bloc,
      DepositCheckViewModel viewModel) {
    return DepositCheckScreen(
      viewModel: viewModel,
      pressenterAction: DepositCheckPressenterActions(
        bloc,
      ),
    );
  }
}

class DepositCheckPresenterActions {
  DepositCheckBloc bloc;

  DepositCheckPresenterActions(this.bloc);

  popNavigationListener(BuildContext context) {
    CFRouterScope.of(context).pop();
  }

  navigateToDepositCheckConfirm(BuildContext context) {
    CFRouterScope.of(context)
        .push(BusinessBankingRouter.depositCheckConfirmRoute);
  }

  /// listens saved action on User email
  onUserEmailSavedListener(String emailString) {
    if (emailString.isNotEmpty) {
      bloc.depositCheckEventPipe.send(UpdateUserEmailEvent(emailString));
    }
  }

  /// listens saved action on Deposit Amount
  onDepositCheckAmountSavedListener(String amountString) {
    double? amount = double.tryParse(amountString);
    if (amountString.isNotEmpty && (amount != null && amount >= 0)) {
      bloc.depositCheckEventPipe.send(UpdateCheckAmountEvent(amount));
    }
  }

  /// listens action on pick front image of check
  void onPickFrontImg() async {
    bloc.depositCheckEventPipe.send(UpdateCheckImgEvent(CheckImageType.front));
  }

  /// listens action on pick back image of check
  void onPickBackImg() async {
    bloc.depositCheckEventPipe.send(UpdateCheckImgEvent(CheckImageType.back));
  }

  /// listens action on Confirm Button
  void onTapConfirmBtn(BuildContext context, DepositCheckViewModel viewModel) {
    if (viewModel.userInputStatus == UserInputStatus.valid) {
      bloc.depositCheckEventPipe.send(SubmitDepositCheckEvent());

      navigateToDepositCheckConfirm(context);
    } else {
      showErrorDialog(context);
    }
  }

  void showErrorDialog(BuildContext context,
      {String title = 'Invalid', String msg = 'Please fill all fields.'}) {
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
