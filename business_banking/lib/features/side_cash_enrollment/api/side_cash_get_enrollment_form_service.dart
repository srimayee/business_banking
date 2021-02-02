import 'package:business_banking/features/side_cash_enrollment/api/side_cash_get_enrollment_form_response_model.dart';
import 'package:business_banking/locator.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework/clean_framework_defaults.dart';

class SideCashGetEnrollmentFormService extends EitherService<JsonRequestModel,
    SideCashGetEnrollmentFormResponseModel> {
  //TODO  How to verify constructor is called/build correctly?
  //TODO possibly pass in Rest API to allow for mocking?
  SideCashGetEnrollmentFormService()
      : super(
          method: RestMethod.get,
          restApi: ExampleLocator().api,
          path: 'get-side-cash-enrollment-form',
        );

  @override
  SideCashGetEnrollmentFormResponseModel parseResponse(
      Map<String, dynamic> jsonResponse) {
    return SideCashGetEnrollmentFormResponseModel.fromJson(jsonResponse);
  }
}
