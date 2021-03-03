import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework/clean_framework_defaults.dart';
import 'package:business_banking/locator.dart';
import 'customer_service_response_model.dart';

class CustomerService
    extends EitherService<JsonRequestModel, CustomerServiceResponseModel> {
  CustomerService()
      : super(
            method: RestMethod.get,
            restApi: ExampleLocator().api,
            path: 'customer');

  @override
  CustomerServiceResponseModel parseResponse(
      Map<String, dynamic> jsonResponse) {
    return CustomerServiceResponseModel.fromJson(jsonResponse);
  }
}
