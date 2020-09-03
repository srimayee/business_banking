import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework/clean_framework_defaults.dart';
import 'package:business_banking/example_locator.dart';

class HelloLandingService extends EitherService<JsonRequestModel, JsonResponseModel> {
  HelloLandingService() : super(
    method: RestMethod.post,
    restApi: ExampleLocator().api,
    path: null
  );
  
  @override
  JsonResponseModel parseResponse(Map<String, dynamic> jsonResponse) {
    return JsonResponseModel.fromJson(jsonResponse);
  }
  
  // Getting error with JsonResponseModel.fromJson(jsonResponse), so I'm going to write a temporary one
  
}