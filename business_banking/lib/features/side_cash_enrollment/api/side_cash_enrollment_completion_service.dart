import 'package:business_banking/features/side_cash_enrollment/api/side_cash_enrollment_completion_request_model.dart';
import 'package:business_banking/features/side_cash_enrollment/api/side_cash_enrollment_completion_response_model.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework/clean_framework_defaults.dart';

import '../../../locator.dart';

class SideCashEnrollmentCompletionService  extends EitherService<SideCashEnrollmentCompletionRequestModel,
    SideCashEnrollmentCompletionResponseModel> {

  SideCashEnrollmentCompletionService()
      : super(
    method: RestMethod.post,
    restApi: ExampleLocator().api,
    path: 'side-cash-enrollment-completion',
  );

  @override
  SideCashEnrollmentCompletionResponseModel parseResponse(Map<String, dynamic> jsonResponse) {
    return SideCashEnrollmentCompletionResponseModel.fromJson(jsonResponse);
  }
}


