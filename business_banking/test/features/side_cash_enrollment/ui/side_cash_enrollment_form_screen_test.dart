import 'package:business_banking/features/side_cash_enrollment/model/enrollment_form_view_model.dart';
import 'package:business_banking/features/side_cash_enrollment/ui/side_cash_enrollment_form_screen.dart';
import 'package:business_banking/features/side_cash_enrollment/ui/side_cash_enrollment_keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../mocks/data_and_function_mocks.dart';

main() {
  // TODO I Should only have to mock the VIEW MODEL... right?

  group('Side Cash Enrollment Form Screen tests', () {
    testWidgets(
        'Enrollment form screen - has the proper elements when laoded with initial view model',
        (WidgetTester tester) async {
      final vm = initialFormViewModel();
      final widget = SideCashEnrollmentFormScreen(
        formViewModel: vm,
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
        updateSelectedAccount: dummyFunctions.updateSelectedAccount,
      );
      final testApp = MaterialApp(home: Scaffold(body: widget));
      await tester.pumpWidget(testApp);
      await tester.pumpAndSettle();

      final checkingAccountRadioTile = find.byKey(Key("account-checking-234"));
      await tester.tap(checkingAccountRadioTile);
      await tester.pumpAndSettle();

      verify(dummyFunctions.updateSelectedAccount(any)).called(1);

      final savingsAccountRadioTile = find.byKey(Key("account-savings-123"));
      await tester.tap(savingsAccountRadioTile);
      await tester.pumpAndSettle();

      verify(dummyFunctions.updateSelectedAccount(any)).called(1);
    });
    testWidgets(
        "selecting a date calls presenter callback function to updateSelectedStartDate",
        (tester) {});
    testWidgets(
        "tapping enroll when selectedAccount != null and selectedStartDate != null calls submitForm callback in presenter",
        (tester) {});
    testWidgets(
        "tapping enroll when selectedAccount != null but selectedStartDate == null calls submitForm but also show ALERT/Please Complete form",
        (tester) {});

    testWidgets(
        "tapping enroll when selectedStartDate != null but selectedAccount == null calls submitForm but also show ALERT/Please Complete form",
        (tester) {});
  });
}
