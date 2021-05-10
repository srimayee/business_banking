import 'package:business_banking/features/online_registration/bloc/online_registration_bloc.dart';
import 'package:business_banking/features/online_registration/bloc/online_registration_form_entry/online_registration_event.dart';
import 'package:business_banking/features/online_registration/model/online_registration_form_entry/online_registration_enums.dart';
import 'package:business_banking/features/online_registration/model/online_registration_form_entry/online_registration_view_model.dart';
import 'package:business_banking/routes.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';

class OnlineRegistrationPresenterActions {
  OnlineRegistrationBloc bloc;

  OnlineRegistrationPresenterActions(this.bloc);

  void navigateToSuccessScreen(BuildContext context) {
    CFRouterScope.of(context).replaceWith(BusinessBankingRouter.successScreen);
  }

  void onUserNameSavedListener(String cardHolderName) {
    if (cardHolderName.isNotEmpty) {
      bloc.onlineRegistrationEventPipe
          .send(UpdateCardHolderNameEvent(cardHolderName));
    }
  }

  void onUserCardNumberSavedListener(String cardNumber) {
    if (cardNumber.isNotEmpty) {
      bloc.onlineRegistrationEventPipe.send(UpdateCardNumberEvent(cardNumber));
    }
  }

  void onUpdateSSNLastFourDigitsSavedListener(String ssnLastFourDigits) {
    if (ssnLastFourDigits.isNotEmpty) {
      bloc.onlineRegistrationEventPipe
          .send(UpdateSSNLastFourDigitsEvent(ssnLastFourDigits));
    }
  }

  void onUpdateEmailSavedListener(String userEmail) {
    if (userEmail.isNotEmpty) {
      bloc.onlineRegistrationEventPipe.send(UpdateUserEmailEvent(userEmail));
    }
  }

  Future<void> onUpdatePasswordListener(String userPassword) async {
    if (userPassword.isNotEmpty) {
      print('updating onUpdatePasswordListener pipe');
      bloc.onlineRegistrationEventPipe
          .send(UpdateUserPasswordEvent(userPassword));
    }
  }

  void showErrorDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text('Invalid'),
        content: Text('Please fill all fields'),
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

  Future<void> onTapCreateAccountBtn(
      BuildContext context, OnlineRegistrationViewModel viewModel) async {
    print('status: ${viewModel.userFormInputStatus}');
    if (viewModel.userFormInputStatus == UserFormInputStatus.valid) {
      await bloc.onlineRegistrationEventPipe
          .send(SubmitOnlineRegistrationEvent());
      navigateToSuccessScreen(context);
    } else {
      showErrorDialog(context);
    }
  }
}
