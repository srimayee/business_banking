import 'package:business_banking/features/side_cash/side_cash_details/bloc/side_cash_details_bloc.dart';
import 'package:business_banking/features/side_cash/side_cash_details/ui/side_cash_details_presenter.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';

class SideCashDetailsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext build) {
    return BlocProvider<SideCashDetailsBloc>(
      create: (_) => SideCashDetailsBloc(),
      child: SideCashDetailsPresenter(),
    );
  }
}
