import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework/clean_framework_defaults.dart';
import 'package:business_banking/locator.dart';
import 'account_detail_service_response_model.dart';

class AccountDetailService
    extends EitherService<JsonRequestModel, AccountDetailServiceResponseModel> {
  AccountDetailService()
      : super(
            method: RestMethod.get,
            restApi: ExampleLocator().api,
            path: 'account-details');

  @override
  AccountDetailServiceResponseModel parseResponse(
      Map<String, dynamic> jsonResponse) {
    return AccountDetailServiceResponseModel.fromJson(jsonResponse);
  }
}
