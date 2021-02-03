import 'dart:convert';

import 'package:business_banking/features/side_cash_enrollment/api/side_cash_enrollment_completion_request_model.dart';
import 'package:business_banking/features/side_cash_enrollment/api/side_cash_enrollment_completion_response_model.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  group("testing response model", () {

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

  });
}
