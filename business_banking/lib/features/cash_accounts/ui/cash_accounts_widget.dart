import 'package:clean_framework/clean_framework.dart';
import 'package:business_banking/features/cash_accounts/bloc/cash_accounts_bloc.dart';
import 'package:flutter/material.dart';

import 'cash_accounts_presenter.dart';

class CashAccountsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<CashAccountsBloc>(
      create: (_) => CashAccountsBloc(),
      child: CashAccountsPresenter(),
    );
  }
}