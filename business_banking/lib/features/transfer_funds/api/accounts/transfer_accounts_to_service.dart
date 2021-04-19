import 'package:business_banking/features/transfer_funds/api/accounts/transfer_accounts_to_request_model.dart';
import 'package:business_banking/features/transfer_funds/api/accounts/transfer_accounts_to_response_model.dart';
import 'package:business_banking/locator.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework/clean_framework_defaults.dart';

class TransferFundsAccountsToService extends EitherService<
    TransferFundsAccountsToRequestModel, TransferFundsAccountsToResponseModel> {
  TransferFundsAccountsToService()
      : super(
            method: RestMethod.post,
            restApi: ExampleLocator().api,
            path: 'transfer-accounts-to');

  @override
  TransferFundsAccountsToResponseModel parseResponse(
      Map<String, dynamic> jsonResponse) {
    return TransferFundsAccountsToResponseModel.fromJson(jsonResponse);
  }
}
