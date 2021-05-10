import 'package:business_banking/features/online_registration/bloc/online_registration_bloc.dart';
import 'package:business_banking/features/online_registration/model/online_registration_success/online_registration_success_view_model.dart';
import 'package:business_banking/features/online_registration/ui/online_registration_success_screen/online_registration_success_screen.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';

class OnlineRegistrationSuccessPresenter extends Presenter<
    OnlineRegistrationBloc,
    OnlineRegistrationSuccessViewModel,
    OnlineRegistrationSuccessScreen> {
  @override
  Stream<OnlineRegistrationSuccessViewModel> getViewModelStream(
      OnlineRegistrationBloc bloc) {
    return bloc.onlineRegistrationSuccessViewModelPipe.receive;
  }

  @override
  OnlineRegistrationSuccessScreen buildScreen(
      BuildContext context,
      OnlineRegistrationBloc bloc,
      OnlineRegistrationSuccessViewModel viewModel) {
    return OnlineRegistrationSuccessScreen(
      viewModel: viewModel,
      // presenterAction: OnlineRegistrationSuccessPresenterActions(bloc),
    );
  }
}

// class OnlineRegistrationSuccessPresenterActions {
//   OnlineRegistrationBloc bloc;
//   OnlineRegistrationSuccessPresenterActions(this.bloc);
//
//   popNavigationListener(BuildContext context) {
//     bloc.onlineRegistrationSuccessEventPipe
//         .send(ResetOnlineRegistrationViewModelEvent());
//     CFRouterScope.of(context).popUntil(BusinessBankingRouter.hubRoute);
//   }
// }
