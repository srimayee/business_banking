import 'package:business_banking/features/online_registration/bloc/online_registration_bloc.dart';
import 'package:business_banking/features/online_registration/model/online_registration_form_entry/online_registration_enums.dart';
import 'package:business_banking/features/online_registration/model/online_registration_form_entry/online_registration_view_model.dart';
import 'package:business_banking/features/online_registration/ui/online_registration_form_entry/online_registration_actions.dart';
import 'package:business_banking/features/online_registration/ui/online_registration_form_entry/online_registration_screen.dart';
import 'package:business_banking/routes.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class OnlineRegistrationPresenter extends Presenter<OnlineRegistrationBloc,
    OnlineRegistrationViewModel, OnlineRegistrationScreen> {
  @override
  Stream<OnlineRegistrationViewModel> getViewModelStream(
      OnlineRegistrationBloc bloc) {
    return bloc.onlineRegistrationViewModelPipe.receive;
  }

  @override
  OnlineRegistrationScreen buildScreen(BuildContext context,
      OnlineRegistrationBloc bloc, OnlineRegistrationViewModel viewModel) {
    SchedulerBinding.instance!.addPostFrameCallback((_) {
      print(
          'viewModel.userFormInputStatus in binding: ${viewModel.userFormInputStatus}');
      if ((viewModel.userFormInputStatus == UserFormInputStatus.valid)) {
        print('Valid in SchedulerBinding');
        navigateToSuccessScreen(context);
      } else {
        print('error in  SchedulerBinding');
        showErrorDialog(context);
      }
    });

    return OnlineRegistrationScreen(
      viewModel: viewModel,
      presenterAction: OnlineRegistrationPresenterActions(
        bloc,
      ),
    );
  }

  void navigateToSuccessScreen(BuildContext context) {
    CFRouterScope.of(context).replaceWith(BusinessBankingRouter.successScreen);
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

  @override
  Widget buildLoadingScreen(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}
