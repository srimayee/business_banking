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
    EnrollmentFormEntity,
    SideCashEnrollmentCompletionRequestModel,
    SideCashEnrollmentCompletionResponseModel,
    SideCashEnrollmentCompletionService> {
  SideCashEnrollmentCompletionServiceAdapter()
      : super(SideCashEnrollmentCompletionService());

  @override
  EnrollmentFormEntity createEntity(
      EnrollmentFormEntity initialEntity,
      SideCashEnrollmentCompletionResponseModel responseModel) {
    return EnrollmentFormEntity(
        submissionMessage: responseModel.message, submissionSuccess: responseModel.isSuccessful);
  }

  @override
  SideCashEnrollmentCompletionRequestModel createRequest(
      EnrollmentFormEntity entity) {
    return SideCashEnrollmentCompletionRequestModel(entity.selectedAccount);
  }
}
