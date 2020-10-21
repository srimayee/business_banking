import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework/clean_framework_defaults.dart';
import 'package:business_banking/locator.dart';
import 'hello_customer_detail_service_response_model.dart';

class HelloCustomerDetailService
    extends EitherService<JsonRequestModel, HelloCustomerDetailServiceResponseModel> {
  HelloCustomerDetailService()
      : super(
            method: RestMethod.get,
            restApi: ExampleLocator().api,
            path: 'hellocustomer');

  @override
  HelloCustomerDetailServiceResponseModel parseResponse(
      Map<String, dynamic> jsonResponse) {
    return HelloCustomerDetailServiceResponseModel.fromJson(jsonResponse);
  }
}
