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

  group('Side Cash Enrollment Form Screen tests', () {
    MockDummyFunctions mockDummyFunctions = MockDummyFunctions();

    testWidgets(
        'Enrollment form screen - has the proper elements when laoded with initial view model',
        (WidgetTester tester) async {
      final vm = initialFormViewModel();
      final widget = SideCashEnrollmentFormScreen(
        formViewModel: vm,
        submitForm: mockDummyFunctions.submitForm,
        updateSelectedAccount: mockDummyFunctions.updateSelectedAccount,
      );
      final testApp = MaterialApp(home: Scaffold(body: widget));
      await tester.pumpWidget(testApp);
      await tester.pumpAndSettle();
      expect(find.byKey(Key("account-checking-234")), findsOneWidget);
      expect(find.byKey(Key("account-savings-123")), findsOneWidget);
      expect(
          find.byKey(
              SideCashEnrollmentWidgetKeys.sideCashEnrollmentFormScaffold),
          findsOneWidget);
      expect(find.byKey(SideCashEnrollmentWidgetKeys.sideCashEnrollButton),
          findsOneWidget);
    });


    testWidgets(
        "selecting an account calls presenter callback function to updateSelectedAccount()",
        (tester) async {
      final dummyFunctions = MockDummyFunctions();
      final vm = initialFormViewModel();
      final widget = SideCashEnrollmentFormScreen(
        formViewModel: vm,
        submitForm: dummyFunctions.submitForm,
        updateSelectedAccount: dummyFunctions.updateSelectedAccount,
      );
      final testApp = MaterialApp(home: Scaffold(body: widget));
      await tester.pumpWidget(testApp);
      await tester.pumpAndSettle();

      final checkingAccountRadioTile = find.byKey(Key("side_cash_account_radio_button-checking-234"));
      await tester.tap(checkingAccountRadioTile);
      await tester.pumpAndSettle();

      verify(dummyFunctions.updateSelectedAccount(any)).called(1);

      final savingsAccountRadioTile = find.byKey(Key("side_cash_account_radio_button-savings-123"));
      await tester.tap(savingsAccountRadioTile);
      await tester.pumpAndSettle();

      verify(dummyFunctions.updateSelectedAccount(any)).called(1);
    });

    testWidgets(
        "tapping enroll when selectedAccount  calls submitForm callback in presenter",
        (tester) async {
      final widget = SideCashEnrollmentFormScreen(
        formViewModel: EnrollmentFormViewModel(
            selectedAccount: "any", accounts: ["test1", "test2"]),
        updateSelectedAccount: mockDummyFunctions.updateSelectedAccount,
        submitForm: mockDummyFunctions.submitForm,
      );
      final testApp = MaterialApp(home: Scaffold(body: widget));
      await tester.pumpWidget(testApp);
      final enrollBtn =
          find.byKey(SideCashEnrollmentWidgetKeys.sideCashFormSubmitButton);
      await tester.tap(enrollBtn);
      verify(mockDummyFunctions.submitForm(any)).called(1);
    });

    testWidgets(
        "tapping a radio button   calls updateSelectedAccount callback in presenter",
            (tester) async {
          final widget = SideCashEnrollmentFormScreen(
            formViewModel: EnrollmentFormViewModel(
                selectedAccount: "any", accounts: ["test1", "test2"]),
            updateSelectedAccount: mockDummyFunctions.updateSelectedAccount,
            submitForm: mockDummyFunctions.submitForm,
          );
          final testApp = MaterialApp(home: Scaffold(body: widget));
          await tester.pumpWidget(testApp);
          final radioButton =
          find.byKey(Key("side_cash_account_radio_button-test1"));
          await tester.tap(radioButton);
          verify(mockDummyFunctions.updateSelectedAccount(any)).called(1);
        });

  });
}
