import 'package:business_banking/features/login/bloc/login_bloc.dart';
import 'package:business_banking/features/login/model/login_view_model.dart';
import 'package:business_banking/features/login/ui/login_screen.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class LoginPresenter extends Presenter<LoginBloc, LoginViewModel, LoginScreen> {
  @override
  LoginScreen buildScreen(
      BuildContext context, LoginBloc bloc, LoginViewModel viewModel) {
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      if (viewModel.serviceStatus == ServiceStatus.success) {
        _navigateToHelloWorldScreen(context);
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
      onTapSubmit: () => _onTapSubmit(bloc),
    );
  }

  void _onChangeUserName(LoginBloc bloc, String username) {
    bloc.userNamePipe.send(username);
  }

  void _onChangePassword(LoginBloc bloc, String password) {
    bloc.passwordPipe.send(password);
  }

  void _onTapSubmit(LoginBloc bloc) {
    bloc.submitPipe.launch();
  }

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

  void _navigateToHelloWorldScreen(BuildContext context) {
    //todo handle logic to navigate to second screen here
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
                    child: Text('OK'))
              ],
            ));
  }

  void _showInvalidDataDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
              title: Text('Invalid'),
              content: Text('Data entered is incorrect.'),
              actions: <Widget>[
                FlatButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('OK'))
              ],
            ));
  }
}
