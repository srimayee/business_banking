import 'package:business_banking/features/hub/bloc/hub_bloc.dart';
import 'package:business_banking/features/hub/models/hub_view_model.dart';
import 'package:business_banking/features/hub/ui/hub_screen.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';

class HubPresenter extends Presenter<HubBloc, HubViewModel, HubScreen> {
  @override
  HubScreen buildScreen(BuildContext context, HubBloc bloc, HubViewModel viewModel) {
    return HubScreen(viewModel: viewModel);
  }

  @override
  Widget buildLoadingScreen(BuildContext context) {
    // return Center(
    //   child: CircularProgressIndicator(),
    // );
    return HubScreen();
  }

  @override
  Stream<HubViewModel> getViewModelStream(HubBloc bloc) {
    return bloc.hubViewModelPipe.receive;
  }
}
