import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';

import 'package:business_banking/features/quickpay/bloc/quickpay_bloc.dart';
import 'quickpay_presenter.dart';

class QuickPayWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<QuickPayBloc>(
      create: (_) => QuickPayBloc(),
      child: QuickPayPresenter(),
    );
  }
}