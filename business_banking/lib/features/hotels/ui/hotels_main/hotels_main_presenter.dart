import 'dart:async';
import 'package:flutter/material.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:business_banking/features/hotels/model/hotels_view_model.dart';
import 'package:business_banking/features/hotels/bloc/hotels_bloc.dart';
import 'hotels_main_screen.dart';

class HotelsMainPresenter
    extends Presenter<HotelsBloc, HotelsViewModel, HotelsMainScreen> {
  @override
  Stream<HotelsViewModel> getViewModelStream(HotelsBloc bloc) {
    return bloc.hotelsViewModelPipe.receive;
  }

  @override
  HotelsMainScreen buildScreen(
      BuildContext context, HotelsBloc bloc, HotelsViewModel viewModel) {
    return HotelsMainScreen(
      viewModel: viewModel,
      navigateBack: () {
        _navigateBack(context);
      },
    );
  }

  void _navigateBack(BuildContext context) {
    CFRouterScope.of(context).pop();
  }
}
