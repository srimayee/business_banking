import 'package:business_banking/features/cash_accounts/api/service_response_model.dart';
import 'package:business_banking/features/cash_accounts/bloc/service_adapter.dart';
import 'package:business_banking/features/cash_accounts/model/entity.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Entity is created by service adapter', () {
    final entity = CashAccountsServiceAdapter().createEntity(
        CashAccountsEntity(),
        CashAccountsServiceResponseModel.fromJson({
          'type': 'Employee Checking',
          'lastFour': '6542',
          'balance': 3545.54
        }));

    expect(entity, CashAccountsEntity(
      accountTitle: 'Employee Checking',
      accountNumber: '6542',
      accountBalance: 3545.54
    ));
  });
}