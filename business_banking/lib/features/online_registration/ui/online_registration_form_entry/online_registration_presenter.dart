import 'package:business_banking/features/online_registration/bloc/online_registration_bloc.dart';
import 'package:business_banking/features/online_registration/model/online_registration_form_entry/online_registration_view_model.dart';
import 'package:business_banking/features/online_registration/ui/online_registration_form_entry/online_registration_actions.dart';
import 'package:business_banking/features/online_registration/ui/online_registration_form_entry/online_registration_screen.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';

class OnlineRegistrationPresenter extends Presenter<OnlineRegistrationBloc,
    OnlineRegistrationViewModel, OnlineRegistrationScreen> {
  @override
  OnlineRegistrationScreen buildScreen(BuildContext context,
      OnlineRegistrationBloc bloc, OnlineRegistrationViewModel viewModel) {
    return OnlineRegistrationScreen(
      viewModel: viewModel,
      presenterAction: OnlineRegistrationPresenterActions(
        bloc,
      ),
    );
  }

  @override
  Stream<OnlineRegistrationViewModel> getViewModelStream(
      OnlineRegistrationBloc bloc) {
    return bloc.onlineRegistrationViewModelPipe.receive;
  }

  @override
  Widget buildLoadingScreen(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}
