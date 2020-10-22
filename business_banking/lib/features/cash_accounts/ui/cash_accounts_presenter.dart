import 'dart:async';

import 'package:business_banking/features/cash_accounts/bloc/cash_accounts_bloc.dart';
import 'package:business_banking/features/cash_accounts/model/cash_accounts_list_view_model.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'cash_accounts_screen.dart';


class CashAccountsPresenter extends Presenter<CashAccountsBloc, CashAccountsViewModelList, CashAccountsScreen> {
  @override
  Stream<CashAccountsViewModelList> getViewModelStream(CashAccountsBloc bloc) {
    return bloc.cashAccountsViewModelListPipe.receive;
  }

  @override
  CashAccountsScreen buildScreen(
      BuildContext context,
      CashAccountsBloc bloc,
      CashAccountsViewModelList viewModel) {
    return CashAccountsScreen(
      viewModel: viewModel,
      navigateToAccountDetail: () {
        _navigateToAccountDetail(context);
      },
    );
  }

  void _navigateToAccountDetail(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        settings: RouteSettings(name: 'AccountDetailScreen'),
        //builder: (context) => AccountDetailScreen(),
      ),
    );
  }
}
