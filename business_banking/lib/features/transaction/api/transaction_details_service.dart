import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework/clean_framework_defaults.dart';
import 'package:business_banking/locator.dart';

import 'transaction_details_service_response_model_list.dart';

class TransactionDetailsService extends EitherService<JsonRequestModel,
    TransactionDetailServiceResponseModelList> {
  TransactionDetailsService()
      : super(
            method: RestMethod.get,
            restApi: ExampleLocator().api,
            path: 'account-transactions');

  @override
  TransactionDetailServiceResponseModelList parseResponse(
      Map<String, dynamic> jsonResponse) {
    return TransactionDetailServiceResponseModelList.fromJson(jsonResponse);
  }
}
