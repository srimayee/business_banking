import 'package:business_banking/features/side_cash/get_side_cash/BLoC/get_side_cash_bloc.dart';
import 'package:business_banking/features/side_cash/get_side_cash/ui/get_side_cash_presenter.dart';
import 'package:business_banking/features/side_cash/side_cash_details/bloc/side_cash_details_bloc.dart';
import 'package:flutter/material.dart';

import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';

class GetSideCashWidget extends StatelessWidget {
  @override
  Widget build(BuildContext build) {
    return BlocProvider<GetSideCashBloc>(
      create: (_) => GetSideCashBloc(),
      child: GetSideCashPresenter(),
    );
  }
}
