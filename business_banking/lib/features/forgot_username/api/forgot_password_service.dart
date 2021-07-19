
import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework/clean_framework_defaults.dart';
import 'package:business_banking/locator.dart';

import 'forgot _password_request_model.dart';
import 'forgot_password_response_model.dart';

class ForgotPasswordService
    extends EitherService<ForgotPasswordServiceRequestModel, ForgotPasswordServiceResponseModel> {
  ForgotPasswordService()
      : super(
            method: RestMethod.post,
            restApi: ExampleLocator().api,
            path: 'AUTH_SERVICE_URL');

  @override
  ForgotPasswordServiceResponseModel parseResponse(Map<String, dynamic> jsonResponse) {
    return ForgotPasswordServiceResponseModel.fromJson(jsonResponse);
  }
}
