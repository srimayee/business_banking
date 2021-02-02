import 'package:business_banking/features/side_cash_enrollment/api/side_cash_enrollment_completion_request_model.dart';
import 'package:business_banking/features/side_cash_enrollment/api/side_cash_enrollment_completion_response_model.dart';
import 'package:business_banking/features/side_cash_enrollment/api/side_cash_enrollment_completion_service.dart';
import 'package:business_banking/features/side_cash_enrollment/api/side_cash_get_enrollment_advertisement_service.dart';
import 'package:business_banking/features/side_cash_enrollment/api/side_cash_get_enrollment_advertisment_response_model.dart';
import 'package:business_banking/features/side_cash_enrollment/api/side_cash_get_enrollment_form_response_model.dart';
import 'package:business_banking/features/side_cash_enrollment/api/side_cash_get_enrollment_form_service.dart';
import 'package:business_banking/features/side_cash_enrollment/model/enrollment_advertisement_entity.dart';
import 'package:business_banking/features/side_cash_enrollment/model/enrollment_completion_entity.dart';
import 'package:business_banking/features/side_cash_enrollment/model/enrollment_form_entity.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework/clean_framework_defaults.dart';

class SideCashEnrollmentCompletionServiceAdapter extends ServiceAdapter<
    EnrollmentCompletionEntity,
    SideCashEnrollmentCompletionRequestModel,
    SideCashEnrollmentCompletionResponseModel,
    SideCashEnrollmentCompletionService> {
  SideCashEnrollmentCompletionServiceAdapter()
      : super(SideCashEnrollmentCompletionService());

  @override
  EnrollmentCompletionEntity createEntity(
      EnrollmentCompletionEntity initialEntity,
      SideCashEnrollmentCompletionResponseModel responseModel) {
    return EnrollmentCompletionEntity(
        message: responseModel.message, isSuccess: responseModel.isSuccessful);
  }

  @override
  SideCashEnrollmentCompletionRequestModel createRequest(
      EnrollmentCompletionEntity entity) {
    return SideCashEnrollmentCompletionRequestModel();
  }
}
