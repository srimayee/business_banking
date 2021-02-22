import 'package:business_banking/features/cash_accounts/bloc/cash_accounts_bloc.dart';
import 'package:business_banking/features/cash_accounts/model/cash_accounts_view_model.dart';
import 'cash_accounts_bloc_mock.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('CashAccountsBloc gets view model, mock', () {
    final bloc = CashAccountsBlocMock();

    bloc.cashAccountsViewModelPipe.receive.listen(expectAsync1((model) {
      expect(model, isA<CashAccountsViewModel>());
      expect(model.name, 'Employee Checking');
      expect(model.lastFour.toString(), '6542');
      expect(model.balance.toString(), '3545.54');
    }));
  });

  test('CashAccountsBloc gets view model, real', () {
    final bloc = CashAccountsBloc();

    bloc.cashAccountsViewModelPipe.receive.listen(expectAsync1((model) {
      expect(model, isA<CashAccountsViewModel>());
      expect(model.name, 'Employee Checking');
      expect(model.lastFour.toString(), '6542');
      expect(model.balance.toString(), '3545.54');
    }));
  });
}
