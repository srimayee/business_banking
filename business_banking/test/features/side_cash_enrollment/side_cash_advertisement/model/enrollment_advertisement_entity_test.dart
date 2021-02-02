import 'package:business_banking/features/side_cash_enrollment/model/enrollment_advertisement_entity.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../mocks/data_and_function_mocks.dart';

void main() {
  group("enrollment ADVERTISEMENT entity tests", () {
    // test 1
    test("initial enrollment_advertisement_entity props test", () {
      final EnrollmentAdvertisementEntity entity = initialAdvertisementEntity();
      expect(entity.props, ["Sign Up for Side Cash!"]);
    });
  });
}
