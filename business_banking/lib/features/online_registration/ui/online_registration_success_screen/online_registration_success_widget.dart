import 'package:business_banking/features/online_registration/bloc/online_registration_bloc.dart';
import 'package:business_banking/features/online_registration/ui/online_registration_success_screen/online_registration_success_presenter.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';

class OnlineRegistrationSuccessWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<OnlineRegistrationBloc>(
      create: (_) => OnlineRegistrationBloc(),
      child: OnlineRegistrationSuccessPresenter(),
    );
  }
}
