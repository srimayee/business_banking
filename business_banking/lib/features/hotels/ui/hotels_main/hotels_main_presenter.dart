import 'dart:async';
import 'package:business_banking/features/hotels/model/hotel_view_model.dart';
import 'package:business_banking/features/hotels/model/hotels_list_view_model.dart';
import 'package:flutter/material.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:business_banking/features/hotels/bloc/hotels_bloc.dart';
import 'hotels_main_screen.dart';

class HotelsMainPresenter
    extends Presenter<HotelsBloc, HotelsListViewModel, HotelsMainScreen> {
  @override
  Stream<HotelsListViewModel> getViewModelStream(HotelsBloc bloc) {
    return bloc.hotelsViewModelPipe.receive;
  }

  @override
  HotelsMainScreen buildScreen(BuildContext context, HotelsBloc bloc,
      HotelsListViewModel listViewModel) {
    return HotelsMainScreen(
        viewModel: listViewModel,
        onHotelClicked: (viewModel) {
          _onHotelClicked(bloc, viewModel);
        });
  }

  void _onHotelClicked(HotelsBloc bloc, HotelViewModel viewModel) {
    bloc.hotelLiked(viewModel);
  }
}
