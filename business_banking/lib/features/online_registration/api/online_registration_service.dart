import 'package:business_banking/features/online_registration/api/online_registration_service_request_model.dart';
import 'package:business_banking/features/online_registration/api/online_registration_service_response_model.dart';
import 'package:business_banking/locator.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework/clean_framework_defaults.dart';

class OnlineRegistrationService extends EitherService<
    OnlineRegistrationServiceRequestModel,
    OnlineRegistrationServiceResponseModel> {
  OnlineRegistrationService()
      : super(
            method: RestMethod.post,
            restApi: ExampleLocator().api,
            path: 'create-new-account');

  @override
  OnlineRegistrationServiceResponseModel parseResponse(
      Map<String, dynamic> jsonResponse) {
    return OnlineRegistrationServiceResponseModel.fromJson(jsonResponse);
  }
}
