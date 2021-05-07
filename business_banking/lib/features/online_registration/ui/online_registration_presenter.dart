import 'package:business_banking/features/online_registration/bloc/online_registration_bloc.dart';
import 'package:business_banking/features/online_registration/model/online_registration_view_model.dart';
import 'package:business_banking/features/online_registration/ui/online_registration_screen.dart';
import 'package:business_banking/routes.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';

class OnlineRegistrationPresenter extends Presenter<OnlineRegistrationBloc,
    OnlineRegistrationViewModel, OnlineRegistrationScreen> {
  @override
  OnlineRegistrationScreen buildScreen(BuildContext context,
      OnlineRegistrationBloc bloc, OnlineRegistrationViewModel viewModel) {
    // SchedulerBinding.instance!.addPostFrameCallback((timeStamp) {
    // if (viewModel.serviceStatus == ServiceStatus.success) {
    //   return;
    // } else if (viewModel.serviceStatus == ServiceStatus.fail) {
    //   _showErrorDialog(context);
    // } else if (viewModel.serviceStatus == ServiceStatus.unknown) {
    //   _showInvalidDataDialog(context);
    // }
    // });

    return OnlineRegistrationScreen(
      viewModel: viewModel,
      saveEnteredCardHolderName: (value) {
        _saveEnteredCardHolderName(bloc, value);
      },
      saveEnteredCardNumber: (value) {
        _saveEnteredCardNumber(bloc, value);
      },
      saveEnteredLastFourDigits: (value) {
        _saveEnteredLastFourDigits(bloc, value);
      },
      saveEnteredEmail: (value) {
        _saveEnteredEmail(bloc, value);
      },
      saveEnteredPassword: (value) {
        _saveEnteredPassword(bloc, value);
      },
      // Make login button route to CashAccounts screen, implement login later
      sendToServer: (key, _validate) =>
          _sendToServer(key, bloc, context, validate: _validate),
    );
  }

  void _saveEnteredCardHolderName(
      OnlineRegistrationBloc bloc, String cardHolderName) {
    bloc.cardHolderNamePipe.send(cardHolderName);
  }

  void _saveEnteredCardNumber(OnlineRegistrationBloc bloc, String cardNumber) {
    bloc.cardNumberPipe.send(cardNumber);
  }

  void _saveEnteredEmail(OnlineRegistrationBloc bloc, String email) {
    bloc.emailPipe.send(email);
  }

  void _saveEnteredLastFourDigits(
      OnlineRegistrationBloc bloc, String lastFourDigits) {
    bloc.emailPipe.send(lastFourDigits);
  }

  void _saveEnteredPassword(OnlineRegistrationBloc bloc, String password) {
    print('Entered Password: ${password}');
    bloc.userPasswordPipe.send(password);
  }

  void _sendToServer(
    GlobalKey<FormState> key,
    OnlineRegistrationBloc bloc,
    BuildContext context, {
    AutovalidateMode validate = AutovalidateMode.disabled,
  }) {
    if (key.currentState!.validate()) {
      // No any error in validation
      key.currentState!.save();
      bloc.submitPipe.launch();
      _navigateToSuccessScreen(context);
    } else {
      // validation error
      // setState(() {
      //   _validate = AutovalidateMode.always;
      // });
    }
  }

  @override
  Stream<OnlineRegistrationViewModel> getViewModelStream(
      OnlineRegistrationBloc bloc) {
    return bloc.onlineRegistrationViewModelPipe.receive;
  }

  @override
  Widget buildLoadingScreen(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  void _navigateToSuccessScreen(BuildContext context) {
    CFRouterScope.of(context).replaceWith(BusinessBankingRouter.successScreen);
  }
}
