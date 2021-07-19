import 'package:business_banking/features/forgot_username/bloc/forgot_password_bloc.dart';
import 'package:business_banking/features/forgot_username/model/forgot_password_view_model.dart';
import 'package:business_banking/routes.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import 'forgot_password_screen.dart';

class ForgotPasswordPresenter extends Presenter<ForgotPasswordBloc, ForgotPasswordViewModel, ForgotPasswordScreen> {
  @override
  ForgotPasswordScreen buildScreen(
      BuildContext context, ForgotPasswordBloc bloc, ForgotPasswordViewModel viewModel) {
    SchedulerBinding.instance!.addPostFrameCallback((timeStamp) {
      if (viewModel.serviceStatus == ServiceStatus.success) {
        return;
      } else if (viewModel.serviceStatus == ServiceStatus.fail) {
        _showErrorDialog(context);
      } else if (viewModel.serviceStatus == ServiceStatus.unknown) {
        _showErrorDialog(context);
      }
    });
    var globalKey = GlobalKey<FormState>();
    return ForgotPasswordScreen(
      viewModel: viewModel,
      // once password reset button is hit, put the user back to login page
      onTapSubmit: () => _onTapSubmit(bloc, globalKey, context),
      forgotPasswordFormKey: globalKey,
    );
  }

  void _onTapSubmit(ForgotPasswordBloc bloc, GlobalKey<FormState> formKey, BuildContext context) {
    if(formKey.currentState!.validate()){
      _navigateToLoginScreen(context);
      bloc.submitPipe.launch();
    }
  }

  @override
  Stream<ForgotPasswordViewModel> getViewModelStream(ForgotPasswordBloc bloc) {
    return bloc.forgotPasswordModelPipe.receive;
  }

  @override
  Widget buildLoadingScreen(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  void _navigateToLoginScreen(BuildContext context) {
    CFRouterScope.of(context).replaceWith(BusinessBankingRouter.initialRoute);
  }

  void _showErrorDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text('Error'),
        content: Text('Submit Failed'),
        actions: <Widget>[
          TextButton(
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
