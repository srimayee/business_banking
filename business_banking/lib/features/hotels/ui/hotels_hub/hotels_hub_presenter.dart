import 'dart:async';
import 'package:flutter/material.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:business_banking/features/hotels/model/hotels_view_model.dart';
import 'package:business_banking/features/hotels/bloc/hotels_bloc.dart';
import 'hotels_hub_screen.dart';

class HotelsHubPresenter
    extends Presenter<HotelsBloc, HotelsViewModel, HotelsHubScreen> {
  //
  @override
  Stream<HotelsViewModel> getViewModelStream(HotelsBloc bloc) {
    return bloc.hotelsViewModelPipe.receive;
  }

  @override
  HotelsHubScreen buildScreen(
      BuildContext context, HotelsBloc bloc, HotelsViewModel viewModel) {
    return HotelsHubScreen(viewModel: viewModel);
  }

  /*void _navigateToHotels(BuildContext context) {
    CFRouterScope.of(context).pop();
  }*/
}
