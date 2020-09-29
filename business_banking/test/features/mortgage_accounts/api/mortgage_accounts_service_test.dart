import 'package:business_banking/features/mortgage_accounts/api/mortgage_accounts_service.dart';
import 'package:business_banking/features/mortgage_accounts/api/mortgage_accounts_service_response_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('MortgageAccountsService success', () async {
    final service = MortgageAccountsService();
    final eitherResponse = await service.request();

    expect(eitherResponse.isRight, isTrue);
    expect(
        eitherResponse.fold((_) {}, (m) => m),
        MortgageAccountsServiceResponseModel.fromJson(
            {'type': 'Employee Checking', 'lastFour': '6542', 'balance': 3545.54}));
  });
}