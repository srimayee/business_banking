import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';
import '../bloc/mortgage_bloc.dart';
import '../model/mortgage_view_model.dart';
import 'mortgage_screen.dart';

class MortgagePresenter
    extends Presenter<MortgageBloc, MortgageViewModel, MortgageScreen> {
  @override
  Stream<MortgageViewModel> getViewModelStream(MortgageBloc bloc) {
    return bloc.mortgageViewModelPipe.receive;
  }

  @override
  MortgageScreen buildScreen(
      BuildContext context, MortgageBloc bloc, MortgageViewModel viewModel) {
    return MortgageScreen(
      viewModel: viewModel,
      navigateToMortgageDetail: () {
        _navigateToMortgageDetail(context);
      },
    );
  }

  void _navigateToMortgageDetail(BuildContext context) {
    // TODO: build mortgage detail
    print('NAV TO MORTGAGE DETAIL');
  }
}
