import 'package:business_banking/features/cash_accounts/ui/cash_accounts_widget.dart';
import 'package:business_banking/features/login/bloc/login_bloc.dart';
import 'package:business_banking/features/login/model/login_view_model.dart';
import 'package:business_banking/features/login/ui/login_screen.dart';
import 'package:business_banking/features/navigation_rail/ui/navigation_rail_widget.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class LoginPresenter extends Presenter<LoginBloc, LoginViewModel, LoginScreen> {
  @override
  LoginScreen buildScreen(
      BuildContext context, LoginBloc bloc, LoginViewModel viewModel) {
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
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
      //onTapSubmit: () => _navigateToCashAccountsScreen(context),
      onTapSubmit: () => _showLoginSuccessDialog(context),

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

  void _navigateToCashAccountsScreen(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
            settings: RouteSettings(name: 'CashAccountsWidget'),
            builder: (context) => CashAccountsWidget()));
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

  void _showLoginSuccessDialog(BuildContext context){
    showDialog(
      barrierDismissible: true,
      context: context,
      builder: (_) =>  Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                margin: const EdgeInsets.only(top: 24, bottom: 24, left: 16),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    const Icon(Icons.verified_user),
                    const Flexible(
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Text(
                          'Logged in Successfully!',
                          softWrap: true,key: Key('Form Submit'),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 24, bottom: 24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    RaisedButton(
                      key: Key('Cash Button'),
                      child: const Text('Cash Accounts',style: TextStyle(color: Colors.white),),
                      color: Colors.lightGreen,
                      onPressed: () {
                        Navigator.of(context).pop();
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                settings: RouteSettings(name: 'CashAccountsWidget'),
                                builder: (context) => CashAccountsWidget()));
                      },
                    ),
                    RaisedButton(
                      key: Key('Rail Button'),
                      child: const Text('NavigationRail',style: TextStyle(color: Colors.white),),
                      color: Colors.lightGreen,
                      onPressed: () {
                        Navigator.of(context).pop();
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                settings: RouteSettings(name: 'NavigationRailWidget'),
                                builder: (context) => NavigationRailWidget()));
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );

  }

}
