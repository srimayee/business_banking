import 'package:business_banking/features/mortgage_accounts/api/mortgage_accounts_service_response_model.dart';
import 'package:business_banking/features/mortgage_accounts/model/mortgage_accounts_entity.dart';
import 'package:flutter_test/flutter_test.dart';

import 'mortgage_accounts_mock_service.dart';

void main() {
  test('Entity is created by service adapter', () {
    final entity = MortgageAccountsMockServiceAdapter().createEntity(
        MortgageAccountsEntity(),
        MortgageAccountsServiceResponseModel.fromJson({
          'type': 'Employee Checking',
          'lastFour': '6542',
          'balance': 3545.54
        }));

    expect(entity, MortgageAccountsEntity(
      name: 'Employee Checking',
      lastFour: '6542',
      balance: 3545.54
    ));
  });
}