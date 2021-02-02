import 'package:business_banking/features/side_cash_enrollment/model/enrollment_advertisement_entity.dart';
import 'package:business_banking/features/side_cash_enrollment/model/enrollment_advertisement_view_model.dart';
import 'package:flutter_test/flutter_test.dart';

import '../mocks/data_and_function_mocks.dart';

void main() {
  group("enrollment ADVERTISEMENT view model tests", () {
    // test 1
    test("initial enrollment_advertisement view model props test", () {
      final EnrollmentAdvertisementViewModel vm = initialAdvertisementViewModel();
      expect(vm.props, ["Sign Up for Side Cash!"]);
    });
  });
}
