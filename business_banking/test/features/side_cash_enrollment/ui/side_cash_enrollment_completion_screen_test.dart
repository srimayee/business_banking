import 'package:business_banking/features/side_cash_enrollment/model/enrollment_completion_view_model.dart';
import 'package:business_banking/features/side_cash_enrollment/ui/side_cash_enrollment_completion_screen.dart';
import 'package:business_banking/features/side_cash_enrollment/side_cash_enrollment_keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../mocks/data_and_function_mocks.dart';
import '../mocks/ui_mocks.dart';

main() {
  // TODO I Should only have to mock the VIEW MODEL... right?

  test("assert constructor cannot contain null values", () {
    MockDummyFunctions mockDummyFunctions = MockDummyFunctions();

    expect(
        () => SideCashEnrollmentCompletionScreen(
              exitFeature: mockDummyFunctions.exitFeature,
            ),
        throwsAssertionError);

    expect(
        () => SideCashEnrollmentCompletionScreen(
              viewModel: EnrollmentCompletionViewModel(
                  isSuccess: true, message: "test message"),
            ),
        throwsAssertionError);
  });
  group('Side Cash Enrollment Form Screen tests', () {
    MockDummyFunctions mockDummyFunctions = MockDummyFunctions();
    Widget testWidget;
    setUp(() {
      final screen = SideCashEnrollmentCompletionScreen(
        viewModel: EnrollmentCompletionViewModel(
            isSuccess: true, message: "test message"),
        exitFeature: mockDummyFunctions.exitFeature,
      );
      testWidget = MaterialApp(home: Scaffold(body: screen));
    });

    testWidgets('Enrollment form screen - has the proper elements',
        (WidgetTester tester) async {

      await tester.pumpWidget(testWidget);

      expect(find.byKey(SideCashEnrollmentWidgetKeys.successBooleanMessage),
          findsOneWidget);
      expect(find.byKey(SideCashEnrollmentWidgetKeys.completionMessage),
          findsOneWidget);
      expect(
          find.byKey(SideCashEnrollmentWidgetKeys.enrollmentCompletionScaffold),
          findsOneWidget);
      expect(
          find.byKey(SideCashEnrollmentWidgetKeys.exitEnrollmentFeatureButton),
          findsOneWidget);
    });

    testWidgets("tapping Nice!  calls exitFeature callback in presenter",
        (tester) async {

      await tester.pumpWidget(testWidget);
      final exitButton =
          find.byKey(SideCashEnrollmentWidgetKeys.exitEnrollmentFeatureButton);
      await tester.tap(exitButton);
      verify(mockDummyFunctions.exitFeature(any)).called(1);
    });
  });
}
