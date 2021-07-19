
import 'package:business_banking/features/forgot_username/bloc/forgot_password_bloc.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';

import 'forgot_password_presenter.dart';

class ForgotPasswordFeatureWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ForgotPasswordBloc(),
      child: ForgotPasswordPresenter(),
    );
  }
}
