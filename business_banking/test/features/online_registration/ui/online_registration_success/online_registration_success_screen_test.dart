// @dart = 2.9
import 'package:business_banking/features/online_registration/model/online_registration_form_entry/online_registration_enums.dart';
import 'package:business_banking/features/online_registration/model/online_registration_success/online_registration_success_view_model.dart';
import 'package:business_banking/features/online_registration/ui/online_registration_success_screen/online_registration_success_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  MaterialApp testWidgetSucceed;
  MaterialApp testWidgetFailed;
  OnlineRegistrationSuccessViewModel onlineRegistrationViewModelSucceed;
  OnlineRegistrationSuccessViewModel onlineRegistrationViewModelFailed;

  setUp(() async {
    onlineRegistrationViewModelSucceed = OnlineRegistrationSuccessViewModel(
        cardHolderName: 'Tyler',
        cardNumber: '378282246310005',
        email: 'test@test.com',
        ssnLastFourDigits: '5462',
        userPassword: 'TestPassword@123',
        accountNumberGenerated: '123456789',
        serviceResponseStatus: ServiceResponseStatus.succeed);

    onlineRegistrationViewModelFailed = OnlineRegistrationSuccessViewModel(
        cardHolderName: 'Tyler',
        cardNumber: '378282246310005',
        email: 'test@test.com',
        ssnLastFourDigits: '5462',
        userPassword: 'TestPassword@123',
        accountNumberGenerated: '',
        serviceResponseStatus: ServiceResponseStatus.failed);

    testWidgetSucceed = MaterialApp(
      home: OnlineRegistrationSuccessScreen(
          viewModel: onlineRegistrationViewModelSucceed),
    );

    testWidgetFailed = MaterialApp(
      home: OnlineRegistrationSuccessScreen(
          viewModel: onlineRegistrationViewModelFailed),
    );
  });

  tearDown(() {
    onlineRegistrationViewModelSucceed = null;
    onlineRegistrationViewModelFailed = null;
  });
  group('Create Online Account Success', () {
    testWidgets('should show the screen', (tester) async {
      await tester.pumpWidget(testWidgetSucceed);
      await tester.pump(Duration(milliseconds: 500));
      final widgetType = find.byType(OnlineRegistrationSuccessScreen);
      expect(widgetType, findsOneWidget);
    });

    testWidgets(
        'should show account holder name and account Number generated on Confirmation page with succeed response',
        (tester) async {
      await tester.pumpWidget(testWidgetSucceed);
      await tester.pump(Duration(milliseconds: 500));
      expect(find.text('REGISTRATION CONFIRMATION'), findsOneWidget);
      expect(find.text('Account created for user'), findsOneWidget);
      expect(find.text('${onlineRegistrationViewModelSucceed.cardHolderName}'),
          findsOneWidget);
      expect(find.text('Account Number'), findsOneWidget);
      expect(
          find.text(
              '${onlineRegistrationViewModelSucceed.accountNumberGenerated}'),
          findsOneWidget);
      expect(
          find.text(
              'Login with email ID and password you used while registration to access your account'),
          findsOneWidget);
    });
    testWidgets(
        'should show account info on Confirmation page with failed response',
        (tester) async {
      await tester.pumpWidget(testWidgetFailed);
      await tester.pump(Duration(milliseconds: 500));
      expect(find.text('REGISTRATION CONFIRMATION'), findsOneWidget);
      expect(find.text('Account creation failed for user'), findsOneWidget);
      expect(find.text('${onlineRegistrationViewModelSucceed.cardHolderName}'),
          findsOneWidget);
      expect(find.text('Please try again later!'), findsOneWidget);
    });
  });
}
