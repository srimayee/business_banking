import 'dart:async';
import 'package:business_banking/features/hotels/model/hotels_list_view_model.dart';
import 'package:business_banking/routes.dart';
import 'package:flutter/material.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:business_banking/features/hotels/bloc/hotels_bloc.dart';
import 'hotels_hub_screen.dart';

class HotelsHubPresenter
    extends Presenter<HotelsBloc, HotelsListViewModel, HotelsHubScreen> {
  //
  @override
  Stream<HotelsListViewModel> getViewModelStream(HotelsBloc bloc) {
    return bloc.hotelsViewModelPipe.receive;
  }

  @override
  HotelsHubScreen buildScreen(
      BuildContext context, HotelsBloc bloc, HotelsListViewModel viewModel) {
    return HotelsHubScreen(
        viewModel: viewModel,
        navigateToHotels: () {
          _navigateToHotels(context);
        });
  }

  void _navigateToHotels(BuildContext context) {
    context.router.push(BusinessBankingRouter.hotelsRoute);
  }
}
