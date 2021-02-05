

import 'dart:convert';

import 'package:business_banking/features/side_cash_enrollment/api/side_cash_get_enrollment_advertisement_service.dart';
import 'package:business_banking/features/side_cash_enrollment/api/side_cash_get_enrollment_advertisment_response_model.dart';

import 'package:flutter_test/flutter_test.dart';

import '../mocks/data_and_function_mocks.dart';

main() {
  test('SideCashGetEnrollmentAdvertisementService success', () async {
    final SideCashGetEnrollmentAdvertisementService service =
    SideCashGetEnrollmentAdvertisementService();
    final eitherResponse = await service.request();
    expect(eitherResponse.isRight, isTrue);
    SideCashGetEnrollmentAdvertisementResponseModel response = eitherResponse.fold((_) {}, (m) => m);

    expect(response.message, SideCashGetEnrollmentAdvertisementResponseModel.fromJson(json.decode(jsonDataAdvertisement)).message);

    expect(
      response,
      SideCashGetEnrollmentAdvertisementResponseModel.fromJson(json.decode(jsonDataAdvertisement)),
    );
  });

}
