import 'package:business_banking/features/side_cash_enrollment/model/enrollment_form_entity.dart';
import 'package:flutter_test/flutter_test.dart';

import '../mocks/data_and_function_mocks.dart';

void main() {
  group("enrollment form entity tests", () {
    test("initial enrollment_form_entity props test", () {
      final EnrollmentFormEntity entity = initialFormEntity();
      expect(entity.props, [
        [
          "savings-123",
          "checking-234",
        ],
        null,
        null,
        null,
      ]);
    });

    test("MergeWith selectAccount successfully returns a new entity", () {
      final EnrollmentFormEntity entity = initialFormEntity();
      final EnrollmentFormEntity newEntity =
          entity.merge(selectedAccount: "checking-234");
      expect(newEntity.props, [
        [
          "savings-123",
          "checking-234",
        ],
        "checking-234",
        null,
        null,
      ]);
    });
  });
}
