import 'package:business_banking/features/new_online_registration_form/api/new_online_registration_service_request_model.dart';
import 'package:business_banking/features/new_online_registration_form/api/new_online_registration_service_response_model.dart';
import 'package:business_banking/locator.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework/clean_framework_defaults.dart';

class NewOnlineRegistrationService extends EitherService<
    NewOnlineRegistrationServiceRequestModel,
    NewOnlineRegistrationServiceResponseModel> {
  NewOnlineRegistrationService()
      : super(
            method: RestMethod.post,
            restApi: ExampleLocator().api,
            path: 'create-new-account');

  @override
  NewOnlineRegistrationServiceResponseModel parseResponse(
      Map<String, dynamic> jsonResponse) {
    return NewOnlineRegistrationServiceResponseModel.fromJson(jsonResponse);
  }
}
