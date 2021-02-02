import 'dart:convert';

import 'package:business_banking/features/side_cash_enrollment/api/side_cash_enrollment_completion_request_model.dart';
import 'package:business_banking/features/side_cash_enrollment/api/side_cash_enrollment_completion_response_model.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  group("testing response model", () {
// test parsing
    test("1: parsing expected JSON", () {
      Map<String, dynamic> completeMap = json.decode(
          '{"message": "congrats you are enrolled!", "isSuccessful": true}');

      SideCashEnrollmentCompletionResponseModel responseModel =
          SideCashEnrollmentCompletionResponseModel.fromJson(completeMap);
      expect(responseModel.isSuccessful, true);
      expect(responseModel.message, "congrats you are enrolled!");
    });

    test("2: Response model's props accurate", () {
      Map<String, dynamic> completeMap = json.decode(
          '{"message": "congrats you are enrolled!", "isSuccessful": true}');

      SideCashEnrollmentCompletionResponseModel responseModel =
          SideCashEnrollmentCompletionResponseModel.fromJson(completeMap);
      expect(responseModel.props, ["congrats you are enrolled!", true]);
    });
//
// // TODO is this what we would want to do?
// // test parsing with null required values throws assertation error
//     test("2: parsing null accounts throws assertation error", () {
//       Map<String, dynamic> nullAccountsMap = json.decode(jsonDataNullAccounts);
//       expect(
//           () =>
//               SideCashGetEnrollmentFormResponseModel.fromJson(nullAccountsMap),
//           throwsAssertionError);
//     });
//
// // TODO Test if initialStartDate is null? Currently I am ?? it to DateTime.now()
//
// // test props
//     test("3: Reponse Model's props accurate", () {
//       Map<String, dynamic> completeMap = json.decode(jsonData);
//       List<String> expectedAccountList = ["checking-234", "savings-123"];
//       DateTime expectedStartDate = DateTime.parse("20210131T000000-0600");
//
//       SideCashGetEnrollmentFormResponseModel responseModel =
//           SideCashGetEnrollmentFormResponseModel.fromJson(completeMap);
//       expect(responseModel.props, [expectedAccountList, expectedStartDate]);
//     });
  });
}
