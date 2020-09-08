import 'package:business_banking/features/cash_accounts/bloc/cash_accounts_bloc.dart';
import 'package:business_banking/features/cash_accounts/model/cash_accounts_view_model.dart';
import 'package:business_banking/features/cash_accounts/bloc/cash_accounts_service_adapter.dart';
import 'package:business_banking/features/cash_accounts/model/cash_accounts_entity.dart';
import 'package:business_banking/features/cash_accounts/api/cash_accounts_service_response_model.dart';
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
  
  test('Entity is created by service adapter', () {
    final entity = CashAccountsServiceAdapter().createEntity(
        CashAccountsEntity(),
        CashAccountsServiceResponseModel.fromJson({
          'name': 'Employee Checking',
          'lastFour': '6542',
          'balance': 3545.54
        }));

    expect(entity, CashAccountsEntity(
      name: 'Employee Checking',
      lastFour: '6542',
      balance: 3545.54
    ));
  });
}