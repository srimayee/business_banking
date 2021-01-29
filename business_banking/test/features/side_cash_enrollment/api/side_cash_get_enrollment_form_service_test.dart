import 'dart:convert';

import 'package:business_banking/features/side_cash_enrollment/api/side_cash_get_enrollment_form_response_model.dart';
import 'package:business_banking/features/side_cash_enrollment/api/side_cash_get_enrollment_form_service.dart';
import 'package:business_banking/locator.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework/clean_framework_defaults.dart';
import 'package:flutter_test/flutter_test.dart';

import '../side_cash_enrollment_mocks.dart';

main() {
  test('SideCashGetEnrollmentForm success', () async {
    final SideCashGetEnrollmentFormService service =
        SideCashGetEnrollmentFormService();
    final eitherResponse = await service.request();
    expect(eitherResponse.isRight, isTrue);
    expect(
      eitherResponse.fold((_) {}, (m) => m),
      SideCashGetEnrollmentFormResponseModel.fromJson(json.decode(serviceJson)),
    );
  });

  //TODO determine typical failure scenarios
}
