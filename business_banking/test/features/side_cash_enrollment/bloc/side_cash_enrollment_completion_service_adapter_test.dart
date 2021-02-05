import 'dart:convert';

import 'package:business_banking/features/side_cash_enrollment/api/side_cash_enrollment_completion_response_model.dart';
import 'package:business_banking/features/side_cash_enrollment/api/side_cash_get_enrollment_form_response_model.dart';
import 'package:business_banking/features/side_cash_enrollment/bloc/side_cash_enrollment_completion_service_adapter.dart';
import 'package:business_banking/features/side_cash_enrollment/bloc/side_cash_get_enrollment_form_service_adapter.dart';
import 'package:business_banking/features/side_cash_enrollment/model/enrollment_completion_entity.dart';
import 'package:business_banking/features/side_cash_enrollment/model/enrollment_form_entity.dart';
import 'package:flutter_test/flutter_test.dart';

import '../mocks/data_and_function_mocks.dart';

main() {
  group("Service adapter tests", () {
    test(
        "service adapter created Entity from VALID SideCashEnrollmentCompletionResponseModel",
            () {
          final entity = SideCashEnrollmentCompletionServiceAdapter().createEntity(
            //TODO See Entity constructor for question about valid data
            EnrollmentFormEntity(),
            SideCashEnrollmentCompletionResponseModel.fromJson(
              json.decode('{"message": "success", "isSuccessful": true}'),
            ),
          );

          expect(entity.submissionMessage, "success");
          expect(entity.submissionSuccess , true);

        });

    test(
        "MOCKED service adapter created Entity from VALID SideCashEnrollmentCompletionResponseModel",
            () {
          final entity = SideCashEnrollmentCompletionServiceAdapter().createEntity(
            //TODO See Entity constructor for question about valid data
            EnrollmentFormEntity(),
            SideCashEnrollmentCompletionResponseModel.fromJson(
              json.decode('{"message": "success", "isSuccessful": true}'),
            ),
          );

          expect(entity.submissionMessage, "success");
          expect(entity.submissionSuccess , true);

        });

  });
}
