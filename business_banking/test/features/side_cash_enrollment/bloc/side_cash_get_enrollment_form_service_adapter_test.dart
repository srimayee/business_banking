import 'dart:convert';

import 'package:business_banking/features/side_cash_enrollment/api/side_cash_get_enrollment_form_response_model.dart';
import 'package:business_banking/features/side_cash_enrollment/bloc/side_cash_get_enrollment_form_service_adapter.dart';
import 'package:business_banking/features/side_cash_enrollment/model/enrollment_form_entity.dart';
import 'package:flutter_test/flutter_test.dart';

import '../mocks/data_and_function_mocks.dart';

main() {
  group("Service adapter tests", () {
    test(
        "service adapter created Entity from VALID GetEnrollmentFormServiceResponseModel",
        () {
      final entity = SideCashGetEnrollmentFormServiceAdapter().createEntity(
        //TODO See Entity constructor for question about valid data
        EnrollmentFormEntity(),
        SideCashGetEnrollmentFormResponseModel.fromJson(
          json.decode(serviceJson),
        ),
      );

      expect(entity.accounts, isNotEmpty);
      expect(entity.accounts.length, 2);
      expect(entity.firstAvailableStartDate, DateTime.parse('20210131T000000-0600'));

    });

    // TODO Define Typical Failure Cases for Service Adapter Layer
  });
}
