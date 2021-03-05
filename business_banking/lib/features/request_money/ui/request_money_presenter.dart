import 'dart:async';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'request_money_screen.dart';
import 'package:business_banking/features/request_money/bloc/request_money_bloc.dart';
import 'package:business_banking/features/request_money/model/request_money_view_model.dart';


class RequestMoneyPresenter extends Presenter<RequestMoneyBloc, RequestMoneyViewModel, RequestMoneyScreen> {
  @override
  Stream<RequestMoneyViewModel> getViewModelStream(RequestMoneyBloc bloc) {
    return bloc.quickPayViewModelPipe.receive;
  }

  @override
  RequestMoneyScreen buildScreen(BuildContext context, RequestMoneyBloc bloc, RequestMoneyViewModel viewModel) {
    return RequestMoneyScreen(
      viewModel: viewModel
    );
  }
}