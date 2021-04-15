import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework/clean_framework_defaults.dart';
import 'package:business_banking/locator.dart';

import 'cash_accounts_service_response_model.dart';

class CashAccountsService
    extends EitherService<JsonRequestModel, CashAccountsServiceResponseModel> {

  CashAccountsService()
      : super(
          method: RestMethod.get,
          restApi: ExampleLocator().api,
          path: 'cash-accounts',
        );

  @override
  CashAccountsServiceResponseModel parseResponse(
      Map<String, dynamic> jsonResponse) {

    return CashAccountsServiceResponseModel.fromJson(jsonResponse);
  }
}
