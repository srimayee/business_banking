import 'package:business_banking/features/side_cash_enrollment/ui/side_cash_enrollment_advertisement_screen.dart';
import 'package:business_banking/features/side_cash_enrollment/side_cash_enrollment_keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../SideCash/SideCashDetails/mock_dummy_functions.dart';

main() {
  test("assert constructor cannot take null values", () {
    final mockDummyFunctions = MockDummyFunctions();

    expect(
        () => SideCashEnrollmentAdvertisementScreen(
              enrollTapped: mockDummyFunctions.navigate,
            ),
        throwsAssertionError);

    expect(
        () => SideCashEnrollmentAdvertisementScreen(
              message: "test message",
            ),
        throwsAssertionError);
  });

  group("SideCashEnrollmentAdvertisement Screen Tests", () {
    final mockDummyFunctions = MockDummyFunctions();

    Widget testApp;
    setUp(() {
      final screen = SideCashEnrollmentAdvertisementScreen(
        message: "Mock message",
        enrollTapped: mockDummyFunctions.navigate,
      );
      testApp = MaterialApp(home: Scaffold(body: screen));
    });

    // TODO Test expected message displayed? Right now it will be hardcoded
    testWidgets("screen has correct elements", (tester) async {

      await tester.pumpWidget(testApp);
      expect(
          find.byKey(
              SideCashEnrollmentWidgetKeys.sideCashEnrollAdvertisementHeader),
          findsOneWidget);
      expect(find.byKey(SideCashEnrollmentWidgetKeys.sideCashEnrollButton),
          findsOneWidget);
      expect(find.text("Mock message"), findsOneWidget);
    });

    testWidgets("tapping 'Enroll' tells presenter to fire navigation function",
        (tester) async {

      await tester.pumpWidget(testApp);
      final enrollButton =
          find.byKey(SideCashEnrollmentWidgetKeys.sideCashEnrollButton);
      await tester.tap(enrollButton);
      tester.pumpAndSettle();

      verify(mockDummyFunctions.navigate(any)).called(1);

      // find by key +  tap button
      // verify dummy function fires
    });
  });
}
