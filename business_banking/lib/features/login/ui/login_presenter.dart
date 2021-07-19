import 'package:business_banking/features/login/bloc/login_bloc.dart';
import 'package:business_banking/features/login/model/login_view_model.dart';
import 'package:business_banking/features/login/ui/login_screen.dart';
import 'package:business_banking/routes.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class LoginPresenter extends Presenter<LoginBloc, LoginViewModel, LoginScreen> {
  @override
  LoginScreen buildScreen(
      BuildContext context, LoginBloc bloc, LoginViewModel viewModel) {
    SchedulerBinding.instance!.addPostFrameCallback((timeStamp) {
      if (viewModel.serviceStatus == ServiceStatus.success) {
        return;
      } else if (viewModel.serviceStatus == ServiceStatus.fail) {
        _showErrorDialog(context);
      } else if (viewModel.serviceStatus == ServiceStatus.unknown) {
        _showInvalidDataDialog(context);
      }
    });
    return LoginScreen(
      viewModel: viewModel,
      onChangeUsermame: (value) {
        _onChangeUserName(bloc, value);
      },
      onChangePassword: (value) {
        _onChangePassword(bloc, value);
      },
      // Make login button route to CashAccounts screen, implement login later
      onTapSubmit: () => _navigateToHubScreen(context),
      onTapAccountOnline: () => navigateToAccountRegistrationScreen(context),
      onTapForgotPassword: () => navigateToForgotPasswordScreen(context),
    );
  }

  void _onChangeUserName(LoginBloc bloc, String username) {
    bloc.userNamePipe.send(username);
  }

  void _onChangePassword(LoginBloc bloc, String password) {
    bloc.passwordPipe.send(password);
  }

  // Add back in when login is added
  // void _onTapSubmit(LoginBloc bloc) {
  //   bloc.submitPipe.launch();
  // }

  @override
  Stream<LoginViewModel> getViewModelStream(LoginBloc bloc) {
    return bloc.loginViewModelPipe.receive;
  }

  @override
  Widget buildLoadingScreen(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  void _navigateToHubScreen(BuildContext context) {
    CFRouterScope.of(context).replaceWith(BusinessBankingRouter.hubRoute);
  }

  void navigateToAccountRegistrationScreen(BuildContext context) {
    CFRouterScope.of(context)
        .push(BusinessBankingRouter.newOnlineRegistrationScreen);
  }

  void navigateToForgotPasswordScreen(BuildContext context) {
    CFRouterScope.of(context)
        .push(BusinessBankingRouter.forgotPasswordScreen);
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

  void _showInvalidDataDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text('Invalid'),
        content: Text('Data entered is incorrect.'),
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
