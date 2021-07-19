import 'package:business_banking/features/authorized_users/bloc/authorized_users_bloc.dart';
import 'package:business_banking/features/authorized_users/model/authorized_users_view_model.dart';
import 'package:business_banking/routes.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import 'authorized_users_screen.dart';

class AuthorizedUsersPresenter extends Presenter<AuthorizedUsersBloc, AuthorizedUsersViewModel, AuthorizedUsersScreen> {
  @override
  AuthorizedUsersScreen buildScreen(
      BuildContext context, AuthorizedUsersBloc bloc, AuthorizedUsersViewModel viewModel) {
    SchedulerBinding.instance!.addPostFrameCallback((timeStamp) {
      if (viewModel.serviceStatus == ServiceStatus.success) {
        return;
      } else if (viewModel.serviceStatus == ServiceStatus.fail) {
        print(ServiceStatus.fail.toString());
        _showErrorDialog(context);
      } else if (viewModel.serviceStatus == ServiceStatus.unknown) {
        print(ServiceStatus.unknown.toString());
        _showErrorDialog(context);
      }
    });
    return AuthorizedUsersScreen(
      viewModel: viewModel,
    );
  }

  @override
  Stream<AuthorizedUsersViewModel> getViewModelStream(AuthorizedUsersBloc bloc) {
    return bloc.authorizedUsersModelPipe.receive;
  }

  @override
  Widget buildLoadingScreen(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  @override
  Widget buildErrorScreen(BuildContext context, Object? error) {
    return Container(
      child: Text("Internal Server error" + error.toString()),
    );
  }

  void _showErrorDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text('Error!!'),
        content: Text('Getting authorized users failed.'),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              //CFRouterScope.of(context).pop();
              Navigator.of(context).pop();
            },
            child: Text('OK'),
          )
        ],
      ),
    );
  }
}
