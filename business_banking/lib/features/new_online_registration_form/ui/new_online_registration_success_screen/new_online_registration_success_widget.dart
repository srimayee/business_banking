import 'package:business_banking/features/new_online_registration_form/bloc/new_online_registration_bloc.dart';
import 'package:business_banking/features/new_online_registration_form/ui/new_online_registration_success_screen/new_online_registration_success_presenter.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';

class NewOnlineRegistrationRequestSuccessWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<NewOnlineRegistrationBloc>(
      create: (_) => NewOnlineRegistrationBloc(),
      child: NewOnlineRegistrationSuccessPresenter(),
    );
  }
}
