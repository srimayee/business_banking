import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework/clean_framework_defaults.dart';
import 'package:business_banking/locator.dart';

import 'transaction_detail_service_response_model.dart';

class TransactionDetailsService extends EitherService<JsonRequestModel,
    TransactionDetailsServiceResponseModel> {
  TransactionDetailsService()
      : super(
            method: RestMethod.get,
            restApi: ExampleLocator().api,
            path: 'account-transactions');

  @override
  TransactionDetailsServiceResponseModel parseResponse(
      Map<String, dynamic> jsonResponse) {
    return TransactionDetailsServiceResponseModel.fromJson(jsonResponse);
  }
}
