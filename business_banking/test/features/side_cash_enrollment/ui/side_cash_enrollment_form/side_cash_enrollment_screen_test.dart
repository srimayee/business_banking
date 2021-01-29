import 'package:flutter_test/flutter_test.dart';

main() {


  // TODO I Should only have to mock the VIEW MODEL... right?

  group('Side Cash Enrollment Screen tests', () {
    testWidgets('Scheduled Payments - has the proper elements',
        (WidgetTester tester) async {
      // TestableFeatureWidgetWrapper widget = TestableFeatureWidgetWrapper(
      //     child: Material(
      //       child: ScheduledPaymentsScreen(
      //           viewModel: ScheduledPaymentsByMonthViewModel()


      //       ),
      //     ));

      // await tester.pumpWidget(widget);
      // await tester.pumpAndSettle();
      //
      // expect(find.text(paymentsStrings.scheduledPayments), findsOneWidget);
      // expect(find.text(sharedStrings.cancel), findsOneWidget);
      // expect(find.text(paymentsStrings.noScheduledPayments), findsOneWidget);
    });

    testWidgets(
        "selecting an account calls presenter callback function to updateSelectedAccount()",
        (tester) {});
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




