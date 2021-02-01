import 'package:business_banking/features/side_cash_enrollment/model/enrollment_advertisement_view_model.dart';
import 'package:business_banking/features/side_cash_enrollment/ui/side_cash_enrollment_advertisement/side_cash_enrollment_advertisement_screen.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../SideCash/SideCashDetails/mock_dummy_functions.dart';

main() {
  group("SideCashEnrollmentAdvertisement Screen Tests", () {
    final mockDummyFunctions = MockDummyFunctions();

    _loadMyPayeesScreen(
        WidgetTester tester, EnrollmentAdvertisementViewModel viewModel) async {
      SideCashEnrollmentAdvertisementScreen widget =
          SideCashEnrollmentAdvertisementScreen();

      await tester.pumpWidget(widget);
      await tester.pumpAndSettle(const Duration(milliseconds: 500));
    }

    // TODO Test expected message displayed? Right now it will be hardcoded
    testWidgets("screen has correct elements", (tester){});

    testWidgets("tapping 'Enroll' tells presenter to fire navigation function",
        (tester) {
          // Load screen with dummy function
          // tap button
          // verify dummy function fires

        });

  });
}
