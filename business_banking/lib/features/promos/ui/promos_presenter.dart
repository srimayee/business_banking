import 'package:business_banking/features/promos/bloc/promos_bloc.dart';
import 'package:business_banking/features/promos/models/promos_view_model.dart';
import 'package:business_banking/features/promos/ui/promos_screen.dart';
import 'package:business_banking/locator.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';

class PromoPresenter
    extends Presenter<PromosBloc, PromosViewModel, PromosScreen> {
  @override
  Stream<PromosViewModel> getViewModelStream(PromosBloc bloc) {
    return bloc.promosViewModelPipe.receive;
  }

  @override
  PromosScreen buildScreen(
      BuildContext context, PromosBloc bloc, PromosViewModel viewModel) {
    return PromosScreen(
      viewModel: viewModel,
      openUrl: openUrl,
    );
  }
}
