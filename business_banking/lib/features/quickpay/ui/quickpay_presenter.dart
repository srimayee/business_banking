import 'dart:async';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'quickpay_screen.dart';
import 'package:business_banking/features/quickpay/bloc/quickpay_bloc.dart';
import 'package:business_banking/features/quickpay/model/quickpay_view_model.dart';

class QuickPayPresenter extends Presenter<QuickPayBloc, QuickPayViewModel, QuickPayScreen> {
  @override
  Stream<QuickPayViewModel> getViewModelStream(QuickPayBloc bloc) {
    return bloc.quickPayViewModelPipe.receive;
  }

  @override
  QuickPayScreen buildScreen(BuildContext context, QuickPayBloc bloc, QuickPayViewModel viewModel) {
    return QuickPayScreen(
      viewModel: viewModel,
      navigateToMakePayment: () {
        _navigateToMakePayment(context);
      },
    );
  }

  void _navigateToMakePayment(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        settings: RouteSettings(name: 'payment'),
        builder: (context){},
      ),
    );
  }
}