import 'package:business_banking/features/cash_accounts/api/cash_accounts_service_response_model.dart';
import 'package:business_banking/features/cash_accounts/bloc/cash_accounts_service_adapter.dart';
import 'package:business_banking/features/cash_accounts/model/cash_accounts_entity.dart';
import 'package:business_banking/features/cash_accounts/model/cash_accounts_list_entity.dart';
import 'package:business_banking/locator.dart';
import 'package:flutter_test/flutter_test.dart';

/// This test class will test the Cash Accounts Service Adapter class
/// functionality and object matching.
void main() {
  final bool debugEnabled = false;

  /// Test Title
  test('Entity is created by the Service Adapter', () {
    /// Create Cash Account Entity Model List
    List<CashAccountsEntityModel> cashAccountsEntityModelListManuallyCreated =
        [];
    CashAccountsEntityModel cashAccountsEntityModel = CashAccountsEntityModel();

    /// Create Cash Account Card 1 - Via Object Not JSON Response
    cashAccountsEntityModelListManuallyCreated
        .add(createCashAccountOne(cashAccountsEntityModel));

    /// Create Cash Account Card 2 - Via Object Not JSON Response
    cashAccountsEntityModelListManuallyCreated
        .add(createCashAccountTwo(cashAccountsEntityModel));

    /// Match List of Cash Accounts Entity List to the
    /// CashAccountsEntityModelList Object via
    /// Construction
    CashAccountsEntityModelList cashAccountsEntityModelListCreated =
        CashAccountsEntityModelList(
            errors: [],
            cashAccountsServiceResponseModelList:
                cashAccountsEntityModelListManuallyCreated);

    /// Create Entity Object type from Mocked JSON Response via the
    /// createEntity method from the CashAccountsServiceAdapter
    /// class
    final cashAccountsModelListEntityCreated = CashAccountsServiceAdapter()
        .createEntity(
            cashAccountsEntityModelListCreated,
            CashAccountsServiceResponseModel.fromJson(
                createMockJSONResponse()));

    /// Debug Logging to see data values
    if (debugEnabled) {
      /// Print out Service Created Model Data
      if(debugEnabled) {
        logger().debug('Service Created Object: ' +
            cashAccountsEntityModelListCreated.toString());
      }

      /// Print out Manually Created Model Data
      if(debugEnabled) {
        logger().debug('Manually Created Object: ' +
            cashAccountsEntityModelListManuallyCreated.toString());
      }
    }

    /// Compare the Entity Created to the Entity Fabricated to match
    /// for validation
    expect(cashAccountsModelListEntityCreated.cashAccountsEntityModelList,
        cashAccountsEntityModelListManuallyCreated);
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

/// Create Cash Account #1 For Testing
CashAccountsEntityModel createCashAccountOne(
    CashAccountsEntityModel cashAccountsEntityModel) {
  return cashAccountsEntityModel.merge(

      /// Input Parameters:
      /// {errors,accountTitle, accountNumber, accountBalance, accountStatus}
      errors: null,
      accountTitle: "Checking Account",
      accountNumber: "6542",
      accountBalance: 3545.54,
      accountStatus: "Active");
}

/// Create Cash Account #2 For Testing
CashAccountsEntityModel createCashAccountTwo(
    CashAccountsEntityModel cashAccountsEntityModel) {
  return cashAccountsEntityModel.merge(

      /// Input Parameters:
      /// {errors,accountTitle, accountNumber, accountBalance, accountStatus}
      errors: null,
      accountTitle: "Savings Account",
      accountNumber: "6543",
      accountBalance: 0.02,
      accountStatus: "Active");
}