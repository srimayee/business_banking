import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';

import '../bloc/mortgage_detail_bloc.dart';
import '../model/mortgage_detail_view_model.dart';
import 'mortgage_detail_screen.dart';

class MortgageDetailPresenter extends Presenter<MortgageDetailBloc,
    MortgageDetailViewModel, MortgageDetailScreen> {
  @override
  Stream<MortgageDetailViewModel> getViewModelStream(MortgageDetailBloc bloc) {
    return bloc.mortgageDetailViewModelPipe.receive;
  }

  @override
  MortgageDetailScreen buildScreen(BuildContext context,
      MortgageDetailBloc bloc, MortgageDetailViewModel viewModel) {
    return MortgageDetailScreen(
      viewModel: viewModel,
    );
  }
}
