import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework/clean_framework_defaults.dart';

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
}