// @dart = 2.9
import 'package:business_banking/features/bill_pay/model/first_card/bill_pay_card_view_model.dart';
import 'package:business_banking/features/bill_pay/model/bill.dart';
import 'package:business_banking/features/deposit_check/model/enums.dart';
import 'package:business_banking/features/bill_pay/ui/first_card/bill_pay_card_presenter.dart';
import 'package:business_banking/features/bill_pay/ui/first_card/bill_pay_card_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockPresenterAction extends Mock
    implements BillPayCardPresenterActions {}

void main() {
  MaterialApp testWidgetSucceed;
  MaterialApp testWidgetFailed;
  BillPayCardViewModel billPayViewModelSucceed;
  BillPayCardViewModel billPayViewModelFailed;
  MockPresenterAction mockPresenterAction;

  setUp(() {
    billPayViewModelSucceed = BillPayCardViewModel(
        billsDue: 4,
        serviceResponseStatus: ServiceResponseStatus.succeed);

    billPayViewModelFailed = BillPayCardViewModel(
        billsDue: 0,
        serviceResponseStatus: ServiceResponseStatus.failed);

    mockPresenterAction = MockPresenterAction();

    testWidgetSucceed = MaterialApp(
      home: BillPayCardScreen(
          viewModel: billPayViewModelSucceed,
          presenterActions: mockPresenterAction),
    );

    testWidgetFailed = MaterialApp(
      home: BillPayCardScreen(
          viewModel: billPayViewModelFailed,
          presenterActions: mockPresenterAction),
    );
  });

  tearDown(() {
    billPayViewModelSucceed = null;
    billPayViewModelFailed = null;
    mockPresenterAction = null;
  });
  group('Bill Pay Card', () {
    testWidgets('should show the screen', (tester) async {
      await tester.pumpWidget(testWidgetSucceed);
      await tester.pump(Duration(milliseconds: 500));

      final widgetType = find.byType(BillPayCardScreen);
      expect(widgetType, findsOneWidget);
    });

    testWidgets(
        'should show bills due on Bill Pay card with succeed response',
            (tester) async {
          await tester.pumpWidget(testWidgetSucceed);
          await tester.pumpAndSettle();

          // Title
          expect(find.byKey(Key('Bill-Pay-Card-Title')), findsOneWidget);
          // Divider
          expect(find.byType(Divider), findsOneWidget);
          // Bills Due
          expect(
              find.text(
                  'You have ${billPayViewModelSucceed.billsDue} bill(s) due'),
              findsOneWidget);
          // Pay Button
          expect(
              find.byKey(Key('Bill-Pay-Card-Button')), findsOneWidget);
        });

    testWidgets('should navigate to pay bill page', (tester) async {
      await tester.pumpWidget(testWidgetSucceed);
      await tester.pump(Duration(milliseconds: 500));

      var widget = find.byKey(Key('Bill-Pay-Card-Button'));
      expect(widget, findsOneWidget);
      await tester.tap(widget);
      verify(mockPresenterAction.navigateToBillPay(any)).called(1);
    });

    testWidgets('should show error card when response failed',
            (tester) async {
          await tester.pumpWidget(testWidgetFailed);
          await tester.pump(Duration(milliseconds: 500));

          // Title
          expect(find.byKey(Key('Bill-Pay-Card-Title')), findsOneWidget);
          // Divider
          expect(find.byType(Divider), findsOneWidget);
          // Error
          expect(find.text('Service is not available! Please try again later.'),
              findsOneWidget);
        });

    //TODO: make this function verify you can't go to the next screen if no bills due
    // testWidgets('should not navigate to Deposit Check page on Failed Response',
    //         (tester) async {
    //       await tester.pumpWidget(testWidgetFailed);
    //       await tester.pump(Duration(milliseconds: 500));
    //
    //       var widget = find.byKey(Key('Deposit-Check-Card-Failed'));
    //       expect(widget, findsOneWidget);
    //       await tester.tap(widget);
    //       verifyNever(mockPressenterAction.navigateToDepositCheck(any));
    //     });
  });
}
