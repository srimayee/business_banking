import 'package:business_banking/features/new_online_registration_form/bloc/new_online_registration_bloc.dart';
import 'package:business_banking/features/new_online_registration_form/bloc/new_online_registration_form_entry/new_online_registration_event.dart';
import 'package:business_banking/routes.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewOnlineRegistrationRequestActions {
  NewOnlineRegistrationRequestActions(this.bloc);
  final NewOnlineRegistrationBloc bloc;

  void pressCreateButton(
    BuildContext context,
    String userName,
    String cardNumber,
    String email,
    String password,
  ) {
    String userNameValidated = bloc.validateUserName(userName);
    String userCardNumberValidated = bloc.validateCardHolderNumber(cardNumber);
    String userPasswordValidated = bloc.validateUserPassword(password);

    String userEmail = bloc.validateEmailAddress(email);

    if (userNameValidated.isNotEmpty ||
        userCardNumberValidated.isNotEmpty ||
        userEmail.isNotEmpty ||
        userPasswordValidated.isNotEmpty) {
      _showDialog(context, "Invalid Information!",
          "Please fill in all fields properly");
      return;
    }
    // else if (userNameValidated.isNotEmpty) {
    //   _showDialog(context, "Invalid Information!", userNameValidated);
    //   return;
    // } else if (userCardNumberValidated.isNotEmpty) {
    //   _showDialog(context, "Invalid Information!", userCardNumberValidated);
    //   return;
    // } else if (userEmail.isNotEmpty) {
    //   _showDialog(context, "Invalid Information!", userEmail);
    //   return;
    // } else if (userPasswordValidated.isNotEmpty) {
    //   _showDialog(context, "Invalid Information!", userPasswordValidated);
    //   return;
    // }
    else {
      CFRouterScope.of(context)
          .replaceWith(BusinessBankingRouter.NewSuccessScreen);
    }
  }

  void onUpdateNameParam(String userName) {
    var event = UpdateCardHolderNameRequestEvent(userName);
    bloc.newOnlineRegistrationEventsPipe.send(event);
  }

  void onUpdateNumberParam(String cardNumber) {
    var event = UpdateCardHolderNumberRequestEvent(cardNumber);
    bloc.newOnlineRegistrationEventsPipe.send(event);
  }

  void onUpdateEmailAddress(String email) {
    var event = UpdateEmailAddressRequestEvent(email);
    bloc.newOnlineRegistrationEventsPipe.send(event);
  }

  void onUpdatePassword(String password) {
    var event = UpdateUserPasswordRequestEvent(password);
    bloc.newOnlineRegistrationEventsPipe.send(event);
  }

  void _showDialog(BuildContext context, String title, String message) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(title),
        content: Text(message),
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
