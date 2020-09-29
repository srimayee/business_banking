import 'package:business_banking/features/mortgage_account_details/api/mortgage_account_detail_service_response_model.dart';
import 'package:business_banking/features/mortgage_account_details/bloc/mortgage_account_detail_service_adapter.dart';
import 'package:business_banking/features/mortgage_account_details/model/mortgage_account_detail_entity.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Entity is created by service adapter', () {
    final entity = MortgageAccountDetailServiceAdapter().createEntity(
        MortgageAccountDetailEntity(),
        MortgageAccountDetailServiceResponseModel.fromJson({
          'name': 'Mortgage',
          'lastFour': '6542',
          'accountType': 'Mortgage',
          'routingNum': 746395735,
          'balance': 3545.54,
          'begBalance': 3674.43,
          'penTrans': -128.89,
          'depHolds': 0.00
        }));

    expect(entity, MortgageAccountDetailEntity(
      name: 'Employee Checking',
      lastFour: '6542',
      accountType: 'Employee Checking',
      routingNumber: 746395735,
      balance: 3545.54,
      beginningBalance: 3674.43,
      pendingTransactions: -128.89,
      depositHolds: 0.00
    ));
  });
}