import 'package:business_banking/features/transfer_funds/api/accounts/transfer_accounts_from_response_model.dart';
import 'package:business_banking/locator.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework/clean_framework_defaults.dart';

class TransferFundsAccountsFromService extends EitherService<JsonRequestModel, TransferFundsAccountsFromResponseModel> {
  TransferFundsAccountsFromService() : super(
      method: RestMethod.get,
      restApi: ExampleLocator().api,
      path: 'transfer-accounts-from'
  );

  @override
  TransferFundsAccountsFromResponseModel parseResponse(Map<String, dynamic> jsonResponse) {
    return TransferFundsAccountsFromResponseModel.fromJson(jsonResponse);
  }
}