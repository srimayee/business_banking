import 'package:business_banking/features/mortgage_accounts/bloc/mortgage_accounts_bloc.dart';
import 'package:business_banking/features/mortgage_accounts/model/mortgage_accounts_view_model.dart';
import 'mortgage_accounts_bloc_mock.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('MortgageAccountsBloc gets view model, mock', () {
    final bloc = MortgageAccountsBlocMock();

    bloc.mortgageAccountsViewModelPipe.receive.listen(expectAsync1((model) {
      expect(model, isA<MortgageAccountsViewModel>());
      expect(model.name, 'Employee Checking');
      expect(model.lastFour.toString(), '6542');
      expect(model.balance.toString(), '3545.54');
    }));
  });
  
  test('MortgageAccountsBloc gets view model, real', () {
    final bloc = MortgageAccountsBloc();

    bloc.mortgageAccountsViewModelPipe.receive.listen(expectAsync1((model) {
      expect(model, isA<MortgageAccountsViewModel>());
      expect(model.name, 'Employee Checking');
      expect(model.lastFour.toString(), '6542');
      expect(model.balance.toString(), '3545.54');
    }));
  });
}