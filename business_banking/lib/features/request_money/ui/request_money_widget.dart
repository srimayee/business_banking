import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';

import 'package:business_banking/features/request_money/bloc/request_money_bloc.dart';
import 'request_money_presenter.dart';

class RequestMoneyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<RequestMoneyBloc>(
      create: (_) => RequestMoneyBloc(),
      child: RequestMoneyPresenter(),
    );
  }
}