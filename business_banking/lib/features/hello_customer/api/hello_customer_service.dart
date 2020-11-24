import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework/clean_framework_defaults.dart';
import 'package:business_banking/locator.dart';
import 'hello_customer_service_response_model.dart';

class HelloCustomerService
    extends EitherService<JsonRequestModel, HelloCustomerServiceResponseModel> {
  HelloCustomerService()
      : super(
            method: RestMethod.get,
            restApi: ExampleLocator().api,
            path: 'hellocustomer');

  @override
  HelloCustomerServiceResponseModel parseResponse(
      Map<String, dynamic> jsonResponse) {
    return HelloCustomerServiceResponseModel.fromJson(jsonResponse);
  }
}
