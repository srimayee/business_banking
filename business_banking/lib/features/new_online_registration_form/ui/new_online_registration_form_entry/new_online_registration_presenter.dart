import 'package:business_banking/features/new_online_registration_form/bloc/new_online_registration_bloc.dart';
import 'package:business_banking/features/new_online_registration_form/model/new_online_registration_form_entry/new_online_registration_view_model.dart';
import 'package:business_banking/features/new_online_registration_form/ui/new_online_registration_form_entry/new_online_registration_actions.dart';
import 'package:business_banking/features/new_online_registration_form/ui/new_online_registration_form_entry/new_online_registration_screen.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/cupertino.dart';

class NewOnlineRegistrationRequestPresenter extends Presenter<
    NewOnlineRegistrationBloc,
    NewOnlineRegistrationViewModel,
    NewOnlineRegistrationScreen> {
  @override
  Stream<NewOnlineRegistrationViewModel> getViewModelStream(
      NewOnlineRegistrationBloc bloc) {
    return bloc.newOnlineRegistrationViewModelPipe.receive;
  }

  @override
  NewOnlineRegistrationScreen buildScreen(
      BuildContext context,
      NewOnlineRegistrationBloc bloc,
      NewOnlineRegistrationViewModel viewModel) {
    return NewOnlineRegistrationScreen(
      viewModel: viewModel,
      actions: NewOnlineRegistrationRequestActions(bloc, viewModel),
    );
  }
}
