import 'package:business_banking/features/side_cash_enrollment/ui/side_cash_enrollment_advertisement_screen.dart';
import 'package:business_banking/features/side_cash_enrollment/ui/side_cash_enrollment_keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../SideCash/SideCashDetails/mock_dummy_functions.dart';

main() {
  group("SideCashEnrollmentAdvertisement Screen Tests", () {
    final mockDummyFunctions = MockDummyFunctions();

    // TODO Test expected message displayed? Right now it will be hardcoded
    testWidgets("screen has correct elements", (tester) async {
      final widget = SideCashEnrollmentAdvertisementScreen();
      final testApp = MaterialApp(home: Scaffold(body: widget));
      await tester.pumpWidget(testApp);
      await tester.pumpAndSettle();
      expect(
          find.byKey(
              SideCashEnrollmentWidgetKeys.sideCashEnrollAdvertisementHeader),
          findsOneWidget);
      expect(
          find.byKey(
              SideCashEnrollmentWidgetKeys.sideCashEnrollButton),
          findsOneWidget);
    });

    testWidgets("tapping 'Enroll' tells presenter to fire navigation function",
        (tester) async {
      final mockFunctions = MockDummyFunctions();
      // Load screen with dummy function
      final widget = SideCashEnrollmentAdvertisementScreen(
        enrollTapped: mockFunctions.navigate,
        message: "test",
      );
      final testApp = MaterialApp(home: Scaffold(body: widget));
      await tester.pumpWidget(testApp);
      final enrollButton =
          find.byKey(SideCashEnrollmentWidgetKeys.sideCashEnrollButton);
      await tester.tap(enrollButton);
      tester.pumpAndSettle();

      verify(mockFunctions.navigate(any)).called(1);
      // find by key +  tap button
      // verify dummy function fires
    });
  });
}
