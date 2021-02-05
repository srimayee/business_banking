import 'package:business_banking/features/side_cash_enrollment/model/enrollment_form_view_model.dart';
import 'package:business_banking/features/side_cash_enrollment/ui/side_cash_enrollment_form_screen.dart';
import 'package:business_banking/features/side_cash_enrollment/side_cash_enrollment_keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../mocks/data_and_function_mocks.dart';
import '../mocks/ui_mocks.dart';

main() {
  // TODO I Should only have to mock the VIEW MODEL... right?
  test("assert view model and callbacks cannot be null ", () {
    MockDummyFunctions mockDummyFunctions = MockDummyFunctions();
    // No View Model
    expect(
        () => SideCashEnrollmentFormScreen(
              // formViewModel: initialFormViewModel(),
              submitForm: mockDummyFunctions.submitForm,
              updateSelectedAccount: mockDummyFunctions.updateSelectedAccount,
            ),
        throwsAssertionError);

    // no submitForm callback
    expect(
        () => SideCashEnrollmentFormScreen(
              formViewModel: initialFormViewModel(),
              // submitForm: mockDummyFunctions.submitForm,
              updateSelectedAccount: mockDummyFunctions.updateSelectedAccount,
            ),
        throwsAssertionError);

    // no updateSelectedAccount callback
    expect(
        () => SideCashEnrollmentFormScreen(
              formViewModel: initialFormViewModel(),
              submitForm: mockDummyFunctions.submitForm,
              // updateSelectedAccount: mockDummyFunctions.updateSelectedAccount,
            ),
        throwsAssertionError);
  });

  group('Side Cash Enrollment Form Screen tests', () {
    MockDummyFunctions mockDummyFunctions = MockDummyFunctions();

    Widget testWidget;

    setUp(() {
      final vm = initialFormViewModel();
      final screen = SideCashEnrollmentFormScreen(
        formViewModel: vm,
        submitForm: mockDummyFunctions.submitForm,
        updateSelectedAccount: mockDummyFunctions.updateSelectedAccount,
      );
      testWidget = MaterialApp(home: Scaffold(body: screen));
    });

    testWidgets(
        'Enrollment form screen - has the proper elements when laoded with initial view model',
        (WidgetTester tester) async {
      await tester.pumpWidget(testWidget);
      expect(find.byKey(Key("side_cash_account_radio_button-checking-234")),
          findsOneWidget);
      expect(find.byKey(Key("side_cash_account_radio_button-savings-123")),
          findsOneWidget);
      expect(
          find.byKey(
              SideCashEnrollmentWidgetKeys.sideCashEnrollmentFormScaffold),
          findsOneWidget);
      expect(find.byKey(SideCashEnrollmentWidgetKeys.sideCashFormSubmitButton),
          findsOneWidget);
    });

    testWidgets(
        "selecting an account calls presenter callback function to updateSelectedAccount()",
        (tester) async {
      await tester.pumpWidget(testWidget);

      final checkingAccountRadioTile =
          find.byKey(Key("side_cash_account_radio_button-checking-234"));
      await tester.tap(checkingAccountRadioTile);
      await tester.pumpAndSettle();

      verify(mockDummyFunctions.updateSelectedAccount(any)).called(1);

      final savingsAccountRadioTile =
          find.byKey(Key("side_cash_account_radio_button-savings-123"));
      await tester.tap(savingsAccountRadioTile);
      await tester.pumpAndSettle();

      verify(mockDummyFunctions.updateSelectedAccount(any)).called(1);
    });

    testWidgets(
        "tapping enroll when selectedAccount  calls submitForm callback in presenter",
        (tester) async {
      await tester.pumpWidget(testWidget);

      final enrollBtn =
          find.byKey(SideCashEnrollmentWidgetKeys.sideCashFormSubmitButton);
      await tester.tap(enrollBtn);
      verify(mockDummyFunctions.submitForm(any)).called(1);
    });

    testWidgets(
        "tapping a radio button   calls updateSelectedAccount callback in presenter",
        (tester) async {
      await tester.pumpWidget(testWidget);
      final radioButton =
          find.byKey(Key("side_cash_account_radio_button-checking-234"));
      await tester.tap(radioButton);
      verify(mockDummyFunctions.updateSelectedAccount(any)).called(1);
    });
  });
}
