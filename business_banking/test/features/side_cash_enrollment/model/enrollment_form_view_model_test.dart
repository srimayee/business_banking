import 'package:business_banking/features/side_cash_enrollment/model/enrollment_form_view_model.dart';
import 'package:flutter_test/flutter_test.dart';

import '../mocks/data_and_function_mocks.dart';

void main() {


  group ("enrollment form view model tests", (){


    test("initial enrollment_form_view_model props test", () {
      EnrollmentFormViewModel viewModel = initialFormViewModel();

      expect(viewModel.props, [
        [
          "savings-123",
          "checking-234",
        ],
        null,

      ]);
    });


    test("assert that list of accounts cannot be null", () {
      expect(() => initialFormViewModel(accountsNull: true), throwsAssertionError);
    });

  });

}
