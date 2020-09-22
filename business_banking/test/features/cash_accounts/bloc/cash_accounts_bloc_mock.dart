import 'package:clean_framework/clean_framework.dart';
import 'package:business_banking/features/cash_accounts/bloc/cash_accounts_bloc.dart';
import 'package:business_banking/features/cash_accounts/model/cash_accounts_view_model.dart';
import 'package:mockito/mockito.dart';

class CashAccountsBlocMock extends Fake implements CashAccountsBloc {
  Pipe<CashAccountsViewModel> cashAccountsViewModelPipe = Pipe<CashAccountsViewModel>();

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

  @override
  void dispose() {}
}