import 'dart:async';
import 'package:flutter/material.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:business_banking/features/account_detail/model/account_detail_view_model.dart';
import 'package:business_banking/features/account_detail/bloc/account_detail_bloc.dart';
import 'account_detail_screen.dart';

class AccountDetailPresenter extends Presenter<AccountDetailBloc,
    AccountDetailViewModel, AccountDetailScreen> {
  @override
  Stream<AccountDetailViewModel> getViewModelStream(AccountDetailBloc bloc) {
    return bloc.accountDetailViewModelPipe.receive;
  }

  @override
  AccountDetailScreen buildScreen(BuildContext context, AccountDetailBloc bloc,
      AccountDetailViewModel viewModel) {
    return AccountDetailScreen(
      viewModel: viewModel,
      navigateToCashAccounts: () {
        _navigateToCashAccounts(context);
      },
    );
  }

  void _navigateToCashAccounts(BuildContext context) {
    CFRouterScope.of(context).pop();
  }
}
