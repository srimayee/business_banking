import 'dart:async';
import 'package:business_banking/features/cash_accounts/model/cash_accounts_view_model.dart';
import 'package:business_banking/features/cash_accounts/ui/cash_accounts_screen.dart';
import 'package:business_banking/routes.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../bloc/cash_accounts_bloc_mock.dart';

class CashAccountsPresenterTest extends Presenter<CashAccountsBlocMock,
    CashAccountsViewModel, CashAccountsScreen> {
  @override
  Stream<CashAccountsViewModel> getViewModelStream(CashAccountsBlocMock bloc) {
    return bloc.cashAccountsViewModelPipe.receive;
  }

  @override
  CashAccountsScreen buildScreen(BuildContext context,
      CashAccountsBlocMock bloc, CashAccountsViewModel viewModel) {
    return CashAccountsScreen(
      viewModel: viewModel,
      navigateToAccountDetail: () {
        _navigateToAccountDetail(context);
      },
    );
  }

  void _navigateToAccountDetail(BuildContext context) {
    CFRouterScope.of(context).push(BusinessBankingRouter.accountDetailRoute);
  }
}
