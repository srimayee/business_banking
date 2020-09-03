import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework/clean_framework_defaults.dart';
import 'package:business_banking/example_locator.dart';
import 'hello_landing_service_response_model.dart';

class HelloLandingService extends EitherService<JsonRequestModel, HelloLandingServiceResponseModel> {
  HelloLandingService() : super(
    method: RestMethod.post,
    restApi: ExampleLocator().api,
    path: null
  );
  
  @override
  HelloLandingServiceResponseModel parseResponse(Map<String, dynamic> jsonResponse) {
    return HelloLandingServiceResponseModel.fromJson(jsonResponse);
  }
}