import 'dart:convert';

import 'package:business_banking/features/side_cash_enrollment/api/side_cash_enrollment_completion_request_model.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  group("testing request model", ()
  {
// test parsing
    test("1: parsing expected JSON", () {
      Map<String, dynamic> completeMap =
      json.decode('{"requestedAccount": "checking-234"}');

      SideCashEnrollmentCompletionRequestModel requestModel =
      SideCashEnrollmentCompletionRequestModel("checking-234");
      Map<String, dynamic> requestJson = requestModel.toJson();
      expect(requestJson, completeMap);
    });
  });
}
