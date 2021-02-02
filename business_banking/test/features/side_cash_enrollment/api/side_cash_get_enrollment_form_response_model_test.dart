import 'dart:convert';

import 'package:business_banking/features/side_cash_enrollment/api/side_cash_get_enrollment_form_response_model.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  final String jsonData = """
      {
        "accounts": ["checking-234", "savings-123"],
        "firstAvailableStartDate": "20210131T000000-0600"      
      }
  """;

  final String jsonDataNullStartDate = """
      {
        "accounts": ["checking-234", "savings-123"] 
      }
  """;

  final String jsonDataNullAccounts = """
      {
        "firstAvailableStartDate": "20210131T000000-0600"      
      }
  """;

  group("testing response model", () {
    // test parsing
    test("1: parsing expected JSON", () {
      Map<String, dynamic> completeMap = json.decode(jsonData);
      List<String> expectedAccountList = ["checking-234", "savings-123"];

      SideCashGetEnrollmentFormResponseModel responseModel =
          SideCashGetEnrollmentFormResponseModel.fromJson(completeMap);
      expect(responseModel.accounts, expectedAccountList);
    });

    // TODO is this what we would want to do?
    // test parsing with null required values throws assertation error
    test("2: parsing null accounts throws assertation error", () {
      Map<String, dynamic> nullAccountsMap = json.decode(jsonDataNullAccounts);
      expect(() => SideCashGetEnrollmentFormResponseModel.fromJson(nullAccountsMap), throwsAssertionError);
    });

    // TODO Test if initialStartDate is null? Currently I am ?? it to DateTime.now()

    // test props
    test("3: Reponse Model's props accurate", () {
      Map<String, dynamic> completeMap = json.decode(jsonData);
      List<String> expectedAccountList = ["checking-234", "savings-123"];
      DateTime expectedStartDate = DateTime.parse("20210131T000000-0600");

      SideCashGetEnrollmentFormResponseModel responseModel =
      SideCashGetEnrollmentFormResponseModel.fromJson(completeMap);
      expect(responseModel.props, [expectedAccountList, expectedStartDate]);
    });

  });
}
