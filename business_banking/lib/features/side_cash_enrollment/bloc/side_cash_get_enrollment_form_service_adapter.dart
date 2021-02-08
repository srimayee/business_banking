import 'package:business_banking/features/side_cash_enrollment/api/side_cash_get_enrollment_form_response_model.dart';
import 'package:business_banking/features/side_cash_enrollment/api/side_cash_get_enrollment_form_service.dart';
import 'package:business_banking/features/side_cash_enrollment/model/enrollment_form_entity.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework/clean_framework_defaults.dart';

class SideCashGetEnrollmentFormServiceAdapter extends ServiceAdapter<
    EnrollmentFormEntity,
    JsonRequestModel,
    SideCashGetEnrollmentFormResponseModel,
    SideCashGetEnrollmentFormService> {
  SideCashGetEnrollmentFormServiceAdapter()
      : super(SideCashGetEnrollmentFormService());

  @override
  EnrollmentFormEntity createEntity(EnrollmentFormEntity enrollmentFormEntity,
      SideCashGetEnrollmentFormResponseModel responseModel) {
    return EnrollmentFormEntity(
      accounts: responseModel.accounts,
    );
  }

}
