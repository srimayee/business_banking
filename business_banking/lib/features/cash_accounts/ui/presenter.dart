import 'dart:async';

import 'package:business_banking/features/account_detail/ui/account_detail_widget.dart';
import 'package:business_banking/features/cash_accounts/bloc/bloc.dart';
import 'package:business_banking/features/cash_accounts/model/view_model.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'screen.dart';

class CashAccountsPresenter extends Presenter<CashAccountsBloc,
    CashAccountsViewModel, CashAccountsScreen> {
  @override
  Stream<CashAccountsViewModel> getViewModelStream(CashAccountsBloc bloc) {
    return bloc.cashAccountsViewModelPipe.receive;
  }

  @override
  CashAccountsScreen buildScreen(BuildContext context, CashAccountsBloc bloc,
      CashAccountsViewModel viewModel) {
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
        settings: RouteSettings(name: 'AccountDetailWidget'),
        builder: (context) => AccountDetailWidget(),
      ),
    );
  }
}
