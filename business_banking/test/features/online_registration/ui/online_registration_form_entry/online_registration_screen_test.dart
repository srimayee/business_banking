// @dart = 2.9
import 'package:business_banking/features/deposit_check/model/enums.dart';
import 'package:business_banking/features/online_registration/model/online_registration_form_entry/online_registration_view_model.dart';
import 'package:business_banking/features/online_registration/ui/online_registration_form_entry/online_registration_actions.dart';
import 'package:business_banking/features/online_registration/ui/online_registration_form_entry/online_registration_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockOnlineRegistrationPresenterActions extends Mock
    implements OnlineRegistrationPresenterActions {}

void main() {
  MaterialApp testWidgetSucceed;
  MaterialApp testWidgetFailed;
  MaterialApp testWidgetFailedWithSomeErrors;
  OnlineRegistrationViewModel onlineRegistrationViewModelSucceed;
  OnlineRegistrationViewModel onlineRegistrationViewModelFailed;
  OnlineRegistrationViewModel
      onlineRegistrationViewModelFailedWithSomeValidationErrors;
  MockOnlineRegistrationPresenterActions mockOnlineRegistrationPresenterAction;

  setUp(() {
    onlineRegistrationViewModelSucceed = OnlineRegistrationViewModel(
        cardHolderName: 'Tyler',
        cardNumber: '378282246310005',
        email: 'test@test.com',
        ssnLastFourDigits: '5462',
        userPassword: 'TestPassword@123',
        accountNumberGenerated: '123456789',
        cardHolderNameStatus: '',
        cardNumberStatus: '',
        ssnLastFourDigitsStatus: '',
        userEmailStatus: '',
        userPasswordStatus: '',
        serviceResponseStatus: ServiceResponseStatus.succeed);

    onlineRegistrationViewModelFailed = OnlineRegistrationViewModel(
        cardHolderName: '',
        cardNumber: 'test',
        email: 'test',
        ssnLastFourDigits: '123',
        userPassword: 'Test',
        accountNumberGenerated: '',
        cardHolderNameStatus: 'Please, provide a valid name.',
        cardNumberStatus: 'Enter valid credit card number.',
        ssnLastFourDigitsStatus: 'SSN must be 4 digits.',
        userEmailStatus: 'Please, provide a valid email.',
        userPasswordStatus:
            'Password should be minimum eight characters, at least one uppercase letter, one lowercase letter and one number.',
        serviceResponseStatus: ServiceResponseStatus.failed);

    onlineRegistrationViewModelFailedWithSomeValidationErrors =
        OnlineRegistrationViewModel(
            cardHolderName: 'Tyler',
            cardNumber: 'test',
            email: 'test@test.com',
            ssnLastFourDigits: 'wer4',
            userPassword: 'TestPassword',
            accountNumberGenerated: '',
            cardHolderNameStatus: '',
            cardNumberStatus: 'Enter valid credit card number.',
            ssnLastFourDigitsStatus: 'SSN Number is not valid.',
            userEmailStatus: '',
            userPasswordStatus:
                'Password should be minimum eight characters, at least one uppercase letter, one lowercase letter and one number.',
            serviceResponseStatus: ServiceResponseStatus.failed);

    mockOnlineRegistrationPresenterAction =
        MockOnlineRegistrationPresenterActions();

    testWidgetSucceed = MaterialApp(
      home: OnlineRegistrationScreen(
          viewModel: onlineRegistrationViewModelSucceed,
          presenterAction: mockOnlineRegistrationPresenterAction),
    );

    testWidgetFailed = MaterialApp(
      home: OnlineRegistrationScreen(
          viewModel: onlineRegistrationViewModelFailed,
          presenterAction: mockOnlineRegistrationPresenterAction),
    );

    testWidgetFailedWithSomeErrors = MaterialApp(
      home: OnlineRegistrationScreen(
          viewModel: onlineRegistrationViewModelFailedWithSomeValidationErrors,
          presenterAction: mockOnlineRegistrationPresenterAction),
    );
  });

  Future<void> pumpCreateAccountButton(
      WidgetTester tester, MaterialApp testWidget) async {
    await tester.pumpWidget(testWidget);
    await tester.pumpAndSettle();
    var widget = find.text('Create Account');
    expect(widget, findsOneWidget);
    await tester.tap(widget);
    await tester.pumpAndSettle();
  }

  void verifyParentActions() {
    verify(mockOnlineRegistrationPresenterAction.onUserNameSavedListener(any))
        .called(2);
    verify(mockOnlineRegistrationPresenterAction
            .onUserCardNumberSavedListener(any))
        .called(2);
    verify(mockOnlineRegistrationPresenterAction
            .onUpdateSSNLastFourDigitsSavedListener(any))
        .called(2);
    verify(mockOnlineRegistrationPresenterAction
            .onUpdateEmailSavedListener(any))
        .called(2);
    verify(mockOnlineRegistrationPresenterAction.onUpdatePasswordListener(any))
        .called(2);
    verify(mockOnlineRegistrationPresenterAction.onTapCreateAccountBtn(
            any, any))
        .called(1);
  }

  tearDown(() {
    onlineRegistrationViewModelSucceed = null;
    onlineRegistrationViewModelFailed = null;
    mockOnlineRegistrationPresenterAction = null;
  });
  group('Online Registration screen', () {
    testWidgets('should shows the Registration screen with static details',
        (tester) async {
      await tester.pumpWidget(testWidgetSucceed);
      await tester.pump(Duration(milliseconds: 500));
      final widgetType = find.byType(OnlineRegistrationScreen);
      expect(widgetType, findsOneWidget);
      expect(find.text('Full Name'), findsOneWidget);
      expect(find.text('Credit Card Number'), findsOneWidget);
      expect(find.text('SSN Last Four Digits'), findsOneWidget);
      expect(find.text('Credit Card Number'), findsOneWidget);
      expect(find.text('Email ID'), findsOneWidget);
      expect(find.text('Password'), findsOneWidget);
    });

    testWidgets(
        'should call registration form presenter actions on tap of Create Account button',
        (tester) async {
      await pumpCreateAccountButton(tester, testWidgetSucceed);
      verifyParentActions();
    });

    testWidgets('when user enter value It should be findable', (tester) async {
      await tester.pumpWidget(testWidgetSucceed);
      var cardHolderNameWidget =
          find.byKey(const Key('cardHolderName-TxtField'));
      expect(cardHolderNameWidget, findsOneWidget);
      await tester.enterText(cardHolderNameWidget, 'Tyler');

      var cardHolderNumberWidget =
          find.byKey(const Key('cardHolderNumber-TxtField'));
      expect(cardHolderNumberWidget, findsOneWidget);
      await tester.enterText(cardHolderNumberWidget, '378282246310005');

      var ssnLastFourDigitsWidget =
          find.byKey(const Key('ssnLastFourDigits-TxtField'));
      expect(ssnLastFourDigitsWidget, findsOneWidget);
      await tester.enterText(ssnLastFourDigitsWidget, '5462');

      var userEmailAddressWidget =
          find.byKey(const Key('userEmailAddress-TxtField'));
      expect(userEmailAddressWidget, findsOneWidget);
      await tester.enterText(userEmailAddressWidget, 'test@test.com');

      var userPasswordWidget = find.byKey(const Key('userPassword-TxtField'));
      expect(userPasswordWidget, findsOneWidget);
      await tester.enterText(userPasswordWidget, 'TestPassword@123');

      await pumpCreateAccountButton(tester, testWidgetSucceed);
      expect(find.text('Tyler'), findsOneWidget);
      expect(find.text('378282246310005'), findsOneWidget);
      expect(find.text('5462'), findsOneWidget);
      expect(find.text('test@test.com'), findsOneWidget);
      expect(find.text('TestPassword@123'), findsOneWidget);
    });

    testWidgets('should show errors on view model with status error',
        (tester) async {
      await pumpCreateAccountButton(tester, testWidgetFailed);
      verifyParentActions();
      expect(find.text('Please, provide a valid name.'), findsOneWidget);
      expect(find.text('Enter valid credit card number.'), findsOneWidget);
      expect(find.text('SSN must be 4 digits.'), findsOneWidget);
      expect(find.text('Please, provide a valid email.'), findsOneWidget);
      expect(
          find.text(
              'Password should be minimum eight characters, at least one uppercase letter, one lowercase letter and one number.'),
          findsOneWidget);
    });

    testWidgets('should show some errors on view model with status error',
        (tester) async {
      await pumpCreateAccountButton(tester, testWidgetFailedWithSomeErrors);
      verifyParentActions();
      expect(find.text('Tyler'), findsOneWidget);
      expect(find.text('Enter valid credit card number.'), findsOneWidget);
      expect(find.text('SSN Number is not valid.'), findsOneWidget);
      expect(find.text('test@test.com'), findsOneWidget);
      expect(
          find.text(
              'Password should be minimum eight characters, at least one uppercase letter, one lowercase letter and one number.'),
          findsOneWidget);
    });
  });
}
