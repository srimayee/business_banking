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

  group('Side Cash Enrollment Form Screen tests', () {
    MockDummyFunctions mockDummyFunctions = MockDummyFunctions();

    test("assert View model cannot be null in constructor", () {
      expect(
          () => SideCashEnrollmentCompletionScreen(
                exitFeature: mockDummyFunctions.exitFeature,
              ),
          throwsAssertionError);
    });

    test("assert exit feature callback cannot be null in constructor", () {
      expect(
          () => SideCashEnrollmentCompletionScreen(

                viewModel: EnrollmentCompletionViewModel(
                    isSuccess: true, message: "test message"),
              ),
          throwsAssertionError);
    });

    testWidgets('Enrollment form screen - has the proper elements',
        (WidgetTester tester) async {
      final vm = initialFormViewModel();
      final widget = SideCashEnrollmentCompletionScreen(
        viewModel: EnrollmentCompletionViewModel(
            isSuccess: true, message: "test message"),
        exitFeature: mockDummyFunctions.exitFeature,
      );
      final testApp = MaterialApp(home: Scaffold(body: widget));
      await tester.pumpWidget(testApp);
      await tester.pumpAndSettle();

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
      final widget = SideCashEnrollmentCompletionScreen(
        viewModel:
            EnrollmentCompletionViewModel(message: "test", isSuccess: true),
        exitFeature: mockDummyFunctions.exitFeature,
      );
      final testApp = MaterialApp(home: Scaffold(body: widget));
      await tester.pumpWidget(testApp);
      final exitButton =
          find.byKey(SideCashEnrollmentWidgetKeys.exitEnrollmentFeatureButton);
      await tester.tap(exitButton);
      verify(mockDummyFunctions.exitFeature(any)).called(1);
    });
  });
}
