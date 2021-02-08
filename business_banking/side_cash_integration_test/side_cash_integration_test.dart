import 'package:business_banking/features/side_cash_enrollment/side_cash_enrollment_keys.dart';
import 'package:integration_test/integration_test.dart';

import 'integration_test_helpers.dart';
import 'side_cash_enrollment_keys.dart';
import 'side_cash_helpers.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group("Side Cash Enrollment Driver Tests: ", () {
    testWidgets("registration happy path", (tester) async {
      await startTest(tester);

      await navigateToRegistration();

      await fillAndSubmitForm();

      await exitRegistration();
    });

    testWidgets(
        "tapping enroll on SideCashEnrollmentFormScreen without selecting an account shows error dialog. Tapping okay dismisses it",
        (tester) async {
      await startTest(tester);

      await navigateToRegistration();

      await submitWithNoData();

      await fillAndSubmitForm();

      await exitRegistration();
    });
  });
}
