// @dart=2.9

import 'package:business_banking/features/online_registration/model/online_registration_form_entry/online_registration_enums.dart';
import 'package:business_banking/features/online_registration/model/online_registration_form_entry/online_registration_view_model.dart';
import 'package:business_banking/features/online_registration/ui/online_registration_form_entry/online_registration_actions.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../bloc/online_registration_form_entry/online_registration_bloc_mock.dart';

Element get navElement => find.byType(Navigator).evaluate().first;

class OnTapButton extends StatelessWidget {
  final String id;
  final void Function(BuildContext) onTap;

  const OnTapButton({Key key, this.id, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(id),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('Navigate'),
          onPressed: () => onTap?.call(context),
        ),
      ),
    );
  }
}

void main() {
  OnlineRegistrationBlocMock mockBloc;
  OnlineRegistrationViewModel onlineRegistrationViewModel;
  OnlineRegistrationViewModel onlineRegistrationViewModelOnError;
  OnlineRegistrationPresenterActions actions;

  setUp(() {
    mockBloc = OnlineRegistrationBlocMock();
    onlineRegistrationViewModel = OnlineRegistrationViewModel(
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
      userFormInputStatus: UserFormInputStatus.valid,
    );

    onlineRegistrationViewModelOnError = OnlineRegistrationViewModel(
      cardHolderName: '',
      cardNumber: 'test',
      email: 'test',
      ssnLastFourDigits: '123',
      userPassword: 'TestPassword@123',
      accountNumberGenerated: '',
      cardHolderNameStatus: 'Name is Required',
      cardNumberStatus: 'Card Number is Required',
      ssnLastFourDigitsStatus: 'SSN must be 4 digits',
      userEmailStatus: 'Email is not valid',
      userPasswordStatus: 'Password is required',
      userFormInputStatus: UserFormInputStatus.invalid,
    );
    actions = OnlineRegistrationPresenterActions(mockBloc);
  });

  tearDown(() {
    mockBloc = null;
  });

  test(
      'should parentActions send event through the pipe on UserEmailSavedListener',
      () async {
    actions.onUpdateEmailSavedListener('sample@hnb.com');

    mockBloc.onlineRegistrationViewModelPipe.receive.listen((event) {
      expect(event, isA<OnlineRegistrationViewModel>());
    });
  });

  test(
      'should parentActions send event through the pipe on onUserNameSavedListener',
      () async {
    actions.onUserNameSavedListener('Thompson');
    mockBloc.onlineRegistrationViewModelPipe.receive.listen((event) {
      expect(event, isA<OnlineRegistrationViewModel>());
    });
  });

  test(
      'should parentActions send event through the pipe on onUserCardNumberSavedListener',
      () async {
    actions.onUserCardNumberSavedListener('378282246310005');
    mockBloc.onlineRegistrationViewModelPipe.receive.listen((event) {
      expect(event, isA<OnlineRegistrationViewModel>());
    });
  });

  test(
      'should parentActions send event through the pipe on onUpdateSSNLastFourDigitsSavedListener',
      () async {
    actions.onUpdateSSNLastFourDigitsSavedListener('5462');
    mockBloc.onlineRegistrationViewModelPipe.receive.listen((event) {
      expect(event, isA<OnlineRegistrationViewModel>());
    });
  });
  test(
      'should parentActions send event through the pipe on onUpdatePasswordListener',
      () async {
    actions.onUpdatePasswordListener('Test123@test');
    mockBloc.onlineRegistrationViewModelPipe.receive.listen((event) {
      expect(event, isA<OnlineRegistrationViewModel>());
    });
  });

  testWidgets(
      'should parentActions send event through the pipe on onTapCreateAccountBtn when userInput is valid',
      (WidgetTester tester) async {
    Widget buildWidget({
      String initialRoute = '/',
      CFRouteGenerator generator,
      void Function(CFRoutePage) onUpdate,
    }) {
      return CFRouterScope(
        initialRoute: initialRoute,
        routeGenerator: generator,
        builder: (context) {
          return MaterialApp.router(
            routerDelegate: CFRouterDelegate(context, onUpdate: onUpdate),
            routeInformationParser: CFRouteInformationParser(),
          );
        },
      );
    }

    await tester.pumpWidget(buildWidget(generator: (name) {
      switch (name) {
        case '/':
          return OnTapButton(
            id: 'SuccessScreen',
            onTap: (context) => actions.onTapCreateAccountBtn(
                context, onlineRegistrationViewModel),
          );
        default:
          return Container();
      }
    }));
    expect(navElement.router.previousPage?.name, isNull);
    expect(navElement.router.currentPage.name, '/');
    await tester.tap(find.byType(ElevatedButton));
    await tester.pumpAndSettle();
    mockBloc.onlineRegistrationViewModelPipe.receive.listen((event) {
      expect(event, isA<OnlineRegistrationViewModel>());
    });
    expect(navElement.router.currentPage.name, '/successScreen');
  });

  testWidgets(
      'should parentActions send event through the pipe on onTapCreateAccountBtn when userInput is Invalid',
      (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
        home: OnTapButton(
      id: 'errorDialog',
      onTap: (context) {
        actions.onTapCreateAccountBtn(
            context, onlineRegistrationViewModelOnError);
      },
    )));
    await tester.tap(find.byType(ElevatedButton));
    await tester.pumpAndSettle();
    expect(find.text('Invalid'), findsOneWidget);
    expect(find.text('Please fill all fields'), findsOneWidget);
    expect(find.text('OK'), findsOneWidget);
    await tester.tap(find.text('OK'));
    await tester.pumpAndSettle();
    expect(find.text('Invalid'), findsNothing);
    expect(find.text('Please fill all fields'), findsNothing);
    expect(find.text('OK'), findsNothing);
  });
}
