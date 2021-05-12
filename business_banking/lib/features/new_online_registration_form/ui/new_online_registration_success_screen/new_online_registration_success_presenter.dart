import 'package:business_banking/features/new_online_registration_form/bloc/new_online_registration_bloc.dart';
import 'package:business_banking/features/new_online_registration_form/model/new_online_registration_success/new_online_registration_success_view_model.dart';
import 'package:business_banking/features/new_online_registration_form/ui/new_online_registration_success_screen/new_online_registration_success_screen.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';

class NewOnlineRegistrationSuccessPresenter extends Presenter<
    NewOnlineRegistrationBloc,
    NewOnlineRegistrationRequestSuccessViewModel,
    NewOnlineRegistrationSuccessScreen> {
  @override
  Stream<NewOnlineRegistrationRequestSuccessViewModel> getViewModelStream(
      NewOnlineRegistrationBloc bloc) {
    return bloc.newOnlineRegistrationSuccessViewModelPipe.receive;
  }

  @override
  NewOnlineRegistrationSuccessScreen buildScreen(
      BuildContext context,
      NewOnlineRegistrationBloc bloc,
      NewOnlineRegistrationRequestSuccessViewModel viewModel) {
    return NewOnlineRegistrationSuccessScreen(
      viewModel: viewModel,
    );
  }
}
