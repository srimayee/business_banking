import 'package:business_banking/features/cash_accounts/bloc/bloc.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';

import 'presenter.dart';

class CashAccountsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<CashAccountsBloc>(
      create: (_) => CashAccountsBloc(),
      child: CashAccountsPresenter(),
    );
  }
}
