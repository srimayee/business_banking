import 'package:business_banking/features/login/bloc/login_bloc.dart';
import 'package:business_banking/features/login/ui/login_presenter.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';

class LoginFeatureWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => LoginBloc(),
      child: LoginPresenter(),
    );
  }
}
