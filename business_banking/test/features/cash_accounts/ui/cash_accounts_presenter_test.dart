import 'dart:async';

import 'package:business_banking/features/cash_accounts/model/cash_accounts_list_view_model.dart';
import 'package:business_banking/features/cash_accounts/ui/cash_accounts_screen.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../bloc/cash_accounts_bloc_mock.dart';


class CashAccountsPresenterTest extends Presenter<CashAccountsBlocMock, CashAccountsViewModelList, CashAccountsScreen> {
  @override
  Stream<CashAccountsViewModelList> getViewModelStream(CashAccountsBlocMock bloc) {
    return bloc.cashAccountsViewModelListPipe.receive;
  }

  @override
  CashAccountsScreen buildScreen(
      BuildContext context,
      CashAccountsBlocMock bloc,
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
    //    builder: (context) => AccountDetailScreen(),
      ),
    );
  }
}
