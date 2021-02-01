import 'dart:convert';

import 'package:business_banking/features/side_cash_enrollment/api/side_cash_get_enrollment_advertisment_response_model.dart';
import 'package:flutter_test/flutter_test.dart';

import '../mocks/data_and_function_mocks.dart';

main() {


  group("testing response model", () {
    // test parsing
    test("1: parsing expected JSON", () {
      Map<String, dynamic> completeMap = json.decode(jsonDataAdvertisement);

      SideCashGetEnrollmentAdvertisementResponseModel responseModel =
      SideCashGetEnrollmentAdvertisementResponseModel.fromJson(completeMap);
      expect(responseModel.message, "yooooyoyoyoy");
    });


    // TODO Test if initialStartDate is null? Currently I am ?? it to DateTime.now()

    // test props
    test("3: Reponse Model's props accurate", () {
      Map<String, dynamic> completeMap = json.decode(jsonDataAdvertisement);

      SideCashGetEnrollmentAdvertisementResponseModel responseModel =
      SideCashGetEnrollmentAdvertisementResponseModel.fromJson(completeMap);
      expect(responseModel.props, ["yooooyoyoyoy"]);
    });

  });
}
