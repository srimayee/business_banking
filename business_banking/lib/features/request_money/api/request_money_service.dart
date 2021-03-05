import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework/clean_framework_defaults.dart';
import 'package:business_banking/locator.dart';
import 'request_money_service_response_model.dart';

class RequestMoneyService extends EitherService<JsonRequestModel, RequestMoneyServiceResponseModel> {
  RequestMoneyService() : super(
      method: RestMethod.get,
      restApi: ExampleLocator().api,
      path: 'request_money'
  );

  @override
  RequestMoneyServiceResponseModel parseResponse(Map<String, dynamic> jsonResponse) {
    return RequestMoneyServiceResponseModel.fromJson(jsonResponse);
  }
}