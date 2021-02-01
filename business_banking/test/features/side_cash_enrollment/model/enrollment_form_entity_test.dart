import 'package:business_banking/features/side_cash_enrollment/model/enrollment_form_entity.dart';
import 'package:flutter_test/flutter_test.dart';

import '../mocks/data_and_function_mocks.dart';

void main() {

  group("enrollment form entity tests", () {
    // test 1
    test("initial enrollment_form_entity props test", () {
      final EnrollmentFormEntity entity = initialEntity();
      expect(entity.props, [
        [
          "savings-123",
          "checking-234",
        ],
        null,
        null,
        DateTime.parse("20210131T000000-0600")
      ]);
    });

    // Test 2
    test("MergeWith selectAccount successfully returns a new entity", () {
      final EnrollmentFormEntity entity = initialEntity();
      final EnrollmentFormEntity newEntity =
          entity.merge(selectedAccount: "checking-234");
      expect(newEntity.props, [
        [
          "savings-123",
          "checking-234",
        ],
        "checking-234",
        null,
        DateTime.parse("20210131T000000-0600")
      ]);
    });

    // Test 3
    test("MergeWith selectedStartDate successfully returns new entity", () {
      final EnrollmentFormEntity entity = initialEntity();
      final DateTime selectedStartDate = DateTime.now();
      final EnrollmentFormEntity newEntity =
          entity.merge(selectedStartDate: selectedStartDate);
      expect(newEntity.props, [
        [
          "savings-123",
          "checking-234",
        ],
        null,
        selectedStartDate,
        DateTime.parse("20210131T000000-0600")
      ]);
    });

    // // Test 4
    // test("assert that list of accounts cannot be empty", () {
    //   expect(() => initialEntity(accountsEmpty: true), throwsAssertionError);
    // });
    //
    // // Test 5
    // test("assert that list of accounts cannot be null", () {
    //   expect(() => initialEntity(accountsNull: true), throwsAssertionError);
    // });
    //
    // // Test 6
    // test("assert that firstAvailableStartDate cannot be null", () {
    //   expect(() => initialEntity(firstAvailableStartDateNull: true),
    //       throwsAssertionError);
    // });
  });
}
