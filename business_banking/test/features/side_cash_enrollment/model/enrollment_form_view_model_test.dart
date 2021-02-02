import 'package:business_banking/features/side_cash_enrollment/model/enrollment_form_view_model.dart';
import 'package:flutter_test/flutter_test.dart';

import '../mocks/data_and_function_mocks.dart';

void main() {


  group ("enrollment form view model tests", (){

    // Test 7
    test("initial enrollment_form_view_model props test", () {
      EnrollmentFormViewModel viewModel = initialFormViewModel();

      expect(viewModel.props, [
        [
          "savings-123",
          "checking-234",
        ],
        null,
        null,
        DateTime.parse("20210131T000000-0600"),
      ]);
    });

    // Test 8
    test("assert that list of accounts cannot be empty", () {
      expect(() => initialFormViewModel(accountsEmpty: true), throwsAssertionError);
    });

    // Test 9
    test("assert that list of accounts cannot be null", () {
      expect(() => initialFormViewModel(accountsNull: true), throwsAssertionError);
    });

    // Test 10
    test("assert that firstAvailableStartDate cannot be null", () {
      expect(() => initialFormViewModel(firstAvailableStartDateNull: true),
          throwsAssertionError);
    });
  });

}
