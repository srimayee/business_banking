import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework/clean_framework_defaults.dart';
import 'hello_landing_request_model.dart';
import 'hello_landing_response_model.dart';

class HelloLandingService extends EitherService<HelloLandingServiceRequestModel, HelloLandingServiceResponseModel> {
  HelloLandingService() : super(
    method: RestMethod.post,
    restApi: ExampleLocator().api,
    path: null
  )
  
  @override
  HelloLandingServiceResponseModel parseResponse(Map<String, dynamic> jsonResponse) {
    return HelloLandingServiceResponseModel.fromJson(jsonResponse);
  }
}