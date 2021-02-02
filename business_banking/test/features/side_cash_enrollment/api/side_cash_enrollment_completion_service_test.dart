import 'dart:convert';

import 'package:business_banking/features/side_cash_enrollment/api/side_cash_enrollment_completion_request_model.dart';
import 'package:business_banking/features/side_cash_enrollment/api/side_cash_enrollment_completion_response_model.dart';
import 'package:business_banking/features/side_cash_enrollment/api/side_cash_enrollment_completion_service.dart';
import 'package:business_banking/locator.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework/clean_framework_defaults.dart';
import 'package:flutter_test/flutter_test.dart';

import '../mocks/data_and_function_mocks.dart';

main() {
  test('SideCashEnrollmentCompletionService success', () async {
    final SideCashEnrollmentCompletionService service =
        SideCashEnrollmentCompletionService();
    final eitherResponse = await service.request(
        requestModel: SideCashEnrollmentCompletionRequestModel("checking-234"));
    expect(eitherResponse.isRight, isTrue);
    expect(
      eitherResponse.fold((_) {}, (m) => m),
      SideCashEnrollmentCompletionResponseModel.fromJson(json.decode('''{
        "message": "congrats you are enrolled!",
        "isSuccessful": true
    }''')),
    );
  });

  //TODO determine typical failure scenarios
}
