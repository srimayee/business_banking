import 'package:business_banking/features/side_cash_enrollment/api/side_cash_get_enrollment_advertisement_service.dart';
import 'package:business_banking/features/side_cash_enrollment/api/side_cash_get_enrollment_advertisment_response_model.dart';
import 'package:business_banking/features/side_cash_enrollment/api/side_cash_get_enrollment_form_response_model.dart';
import 'package:business_banking/features/side_cash_enrollment/api/side_cash_get_enrollment_form_service.dart';
import 'package:business_banking/features/side_cash_enrollment/model/enrollment_advertisement_entity.dart';
import 'package:business_banking/features/side_cash_enrollment/model/enrollment_form_entity.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework/clean_framework_defaults.dart';

class SideCashGetEnrollmentAdvertisementServiceAdapter extends ServiceAdapter<
    EnrollmentAdvertisementEntity,
    JsonRequestModel,
    SideCashGetEnrollmentAdvertisementResponseModel,
    SideCashGetEnrollmentAdvertisementService> {
  SideCashGetEnrollmentAdvertisementServiceAdapter()
      : super(SideCashGetEnrollmentAdvertisementService());

  @override
  EnrollmentAdvertisementEntity createEntity(
      EnrollmentAdvertisementEntity initialEntity,
      SideCashGetEnrollmentAdvertisementResponseModel responseModel) {
    print("in create Entity: ${responseModel.message}");
    return EnrollmentAdvertisementEntity(message: responseModel.message);
  }
  @override
  JsonRequestModel createRequest(EnrollmentAdvertisementEntity entity) {
    // TODO: implement createRequest
    return super.createRequest(entity);
  }

}
