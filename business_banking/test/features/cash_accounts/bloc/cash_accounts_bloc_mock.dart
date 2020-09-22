import 'package:clean_framework/clean_framework.dart';
import 'package:business_banking/features/cash_accounts/bloc/bloc.dart';
import 'package:business_banking/features/cash_accounts/model/view_model.dart';
import 'package:mockito/mockito.dart';

class CashAccountsBlocMock extends Fake implements CashAccountsBloc {
  Pipe<CashAccountsViewModel> cashAccountsViewModelPipe = Pipe<CashAccountsViewModel>();

<<<<<<< HEAD
  // CashAccountsBlocMock() {
  //   cashAccountsViewModelPipe.onListen(() {
  //     cashAccountsViewModelPipe.send(CashAccountsViewModel(
  //         accountTitle: 'Employee Checking',
  //         accountNumber: '6542',
  //         accountBalance: 3545.54,
  //         accountType: 'Cash',
  //         accountStatus: 'Active'
  //       ));
  //   });
  // }
=======
  CashAccountsBlocMock() {
    cashAccountsViewModelPipe.onListen(() {
      cashAccountsViewModelPipe.send(CashAccountsViewModel(
          accountTitle: 'Employee Checking',
          accountNumber: '6542',
          accountBalance: 3545.54,
          accountType: 'Cash',
          accountStatus: 'Active'
        ));
    });
  }
>>>>>>> origin/feat/cash_account_creation_minicard

  @override
  void dispose() {}
}