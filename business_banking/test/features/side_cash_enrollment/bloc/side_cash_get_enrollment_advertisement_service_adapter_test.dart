import 'dart:convert';

import 'package:business_banking/features/side_cash_enrollment/api/side_cash_get_enrollment_advertisment_response_model.dart';
import 'package:business_banking/features/side_cash_enrollment/bloc/side_cash_get_enrollment_advertisment_service_adapter.dart';
import 'package:business_banking/features/side_cash_enrollment/model/enrollment_advertisement_entity.dart';
import 'package:flutter_test/flutter_test.dart';

import '../side_cash_enrollment_mocks.dart';

main() {
  group("Service adapter tests", () {
    test(
        "service adapter created Entity from VALID GetEnrollmentAdvertisementServiceResponseModel",
            () {
          final entity = SideCashGetEnrollmentAdvertisementServiceAdapter().createEntity(
            //TODO See Entity constructor for question about valid data
            EnrollmentAdvertisementEntity(),
            SideCashGetEnrollmentAdvertisementResponseModel.fromJson(
              json.decode(jsonDataAdvertisement),
            ),
          );

          expect(entity.message, "sign up for side cash!");


        });

    // TODO Define Typical Failure Cases for Service Adapter Layer
  });
}
