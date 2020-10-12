import 'package:business_banking/features/cash_accounts/api/cash_accounts_service.dart';
import 'package:business_banking/features/cash_accounts/api/cash_accounts_service_response_model.dart';
import 'package:flutter_test/flutter_test.dart';

/// This test class will validate against the JSON response
/// provided via Mockoon.
void main() {
  /// Test Title
  test('Cash Accounts Service - API Success', () async {
    /// Create Cash Accounts Service Object
    final CashAccountsService cashAccountsService = CashAccountsService();
    final eitherResponse = await cashAccountsService.request();

    /// Create API Service Success Test
    expect(eitherResponse.isRight, isTrue);
    expect(eitherResponse.fold((_) {}, (m) => m),
        CashAccountsServiceResponseModel.fromJson(createMockJSONResponse()));
  }, timeout: Timeout(Duration(seconds: 3)));
}

/// Create Mock JSON Response
Map<String, dynamic> createMockJSONResponse() {
  return {
    "accounts": [
      {
        "accountTitle": "Checking Account",
        "accountNumber": "6542",
        "accountBalance": 3545.54,
        "accountStatus": "Active"
      },
      {
        "accountTitle": "Savings Account",
        "accountNumber": "6543",
        "accountBalance": 0.02,
        "accountStatus": "Active"
      }
    ]
  };
}
