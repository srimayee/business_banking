import 'package:flutter/material.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:business_banking/features/account_detail/bloc/account_detail_bloc.dart';
import 'account_detail_presenter.dart';

class AccountDetailWidget extends StatelessWidget {
  @override
  Widget build(BuildContext build) {
    return BlocProvider<AccountDetailBloc>(
      create: (_) => AccountDetailBloc(),
      child: AccountDetailPresenter(),
    );
  }
}
