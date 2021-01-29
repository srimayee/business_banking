

import 'package:business_banking/features/side_cash_enrollment/api/side_cash_get_enrollment_advertisment_response_model.dart';
import 'package:business_banking/features/side_cash_enrollment/api/side_cash_get_enrollment_form_response_model.dart';
import 'package:business_banking/locator.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework/clean_framework_defaults.dart';

class SideCashGetEnrollmentAdvertisementService extends  EitherService<JsonRequestModel, SideCashGetEnrollmentAdvertisementResponseModel>  {

  //TODO  How to verify constructor is called/build correctly?
  //TODO possibly pass in Rest API to allow for mocking?
  SideCashGetEnrollmentAdvertisementService()
      : super(
    method: RestMethod.get,
    restApi: ExampleLocator().api,
    path: '/get_side_cash_enrollment_advertisement',
  );

  @override
  SideCashGetEnrollmentAdvertisementResponseModel parseResponse(Map<String, dynamic> jsonResponse) {

    print("In parse response");
    return SideCashGetEnrollmentAdvertisementResponseModel.fromJson(jsonResponse);
  }
}