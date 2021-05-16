// @dart=2.9

import 'package:business_banking/features/new_online_registration_form/model/new_online_registration_form_entry/new_online_registration_view_model.dart';
import 'package:business_banking/features/new_online_registration_form/ui/new_online_registration_form_entry/new_online_registration_actions.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../bloc/new_online_registration_form_entry/new_online_registration_bloc_mock.dart';

Element get navElement => find.byType(Navigator).evaluate().first;

class MockNavigatorObserver extends Mock implements NavigatorObserver {}

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
  NewOnlineRegistrationBlocMock mockBloc;
  NewOnlineRegistrationRequestActions actions;
  final mockObserver = MockNavigatorObserver();

  setUp(() {
    mockBloc = NewOnlineRegistrationBlocMock();
    actions = NewOnlineRegistrationRequestActions(mockBloc);
  });

  tearDown(() {
    mockBloc = null;
  });

  test(
      'should parentActions send event through the pipe on onUserNameSavedListener',
      () async {
    actions.onUpdateNameParam('Thompson');

    mockBloc.newOnlineRegistrationViewModelPipe.receive.listen((event) {
      expect(event, isA<NewOnlineRegistrationViewModel>());
    });
  });

  test(
      'should parentActions send event through the pipe on UserEmailSavedListener',
      () async {
    actions.onUpdateEmailAddress('sample@hnb.com');

    mockBloc.newOnlineRegistrationViewModelPipe.receive.listen((event) {
      expect(event, isA<NewOnlineRegistrationViewModel>());
    });
  });

  test(
      'should parentActions send event through the pipe on onUserCardNumberSavedListener',
      () async {
    actions.onUpdateNumberParam('378282246310005');
    mockBloc.newOnlineRegistrationViewModelPipe.receive.listen((event) {
      expect(event, isA<NewOnlineRegistrationViewModel>());
    });
  });
  test(
      'should parentActions send event through the pipe on onUpdatePasswordListener',
      () async {
    actions.onUpdatePassword('Test123@test');
    mockBloc.newOnlineRegistrationViewModelPipe.receive.listen((event) {
      expect(event, isA<NewOnlineRegistrationViewModel>());
    });
  });

  test(
      'should parentActions send event through the pipe on onUpdateCardExpiryDate',
      () async {
    actions.onUpdateCardExpiryDate('08/50');
    mockBloc.newOnlineRegistrationViewModelPipe.receive.listen((event) {
      expect(event, isA<NewOnlineRegistrationViewModel>());
    });
  });

  test('should parentActions send event through the pipe on onCardScanned',
      () async {
    actions.onCardScanned();
    mockBloc.newOnlineRegistrationViewModelPipe.receive.listen((event) {
      expect(event, isA<NewOnlineRegistrationViewModel>());
    });
  });

  testWidgets('navigate success route when userInput is valid',
      (WidgetTester tester) async {
    when(mockBloc.validateUserName(any)).thenReturn('');
    when(mockBloc.validateCardHolderNumber(any)).thenReturn('');
    when(mockBloc.validateEmailAddress(any)).thenReturn('');
    when(mockBloc.validateCardExpiryDate(any)).thenReturn('');
    when(mockBloc.validateUserPassword(any)).thenReturn('');
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
            onTap: (context) => actions.pressCreateButton(
                context,
                'Tyler',
                '378282246310005',
                '08/50',
                'test@test.com',
                'TestPassword@123'),
          );
        default:
          return Container();
      }
    }));
    expect(navElement.router.previousPage?.name, isNull);
    expect(navElement.router.currentPage.name, '/');
    await tester.tap(find.byType(ElevatedButton));
    await tester.pumpAndSettle();
    mockBloc.newOnlineRegistrationViewModelPipe.receive.listen((event) {
      expect(event, isA<NewOnlineRegistrationViewModel>());
    });
    expect(navElement.router.currentPage.name, '/NewSuccessScreen');
  });

  testWidgets('show error dialog when userInput is Invalid',
      (WidgetTester tester) async {
    when(mockBloc.validateUserName(any)).thenReturn('');
    when(mockBloc.validateCardHolderNumber(any)).thenReturn('test');
    when(mockBloc.validateEmailAddress(any)).thenReturn('test');
    when(mockBloc.validateUserPassword(any)).thenReturn('TestPassword@123');
    await tester.pumpWidget(MaterialApp(
      home: OnTapButton(
        id: 'errorDialog',
        onTap: (context) {
          actions.pressCreateButton(
              context, '', 'test', '08/10', 'test', 'TestPassword@123');
        },
      ),
      navigatorObservers: [mockObserver],
    ));
    await tester.tap(find.byType(ElevatedButton));
    await tester.pumpAndSettle();
    expect(find.text('Invalid Information!'), findsOneWidget);
    expect(find.text('Please fill in all fields properly'), findsOneWidget);
    expect(find.text('OK'), findsOneWidget);
    await tester.tap(find.text('OK'));
    await tester.pumpAndSettle();
    verify(mockObserver.didPop(any, any));
    expect(find.text('Invalid Information!'), findsNothing);
    expect(find.text('Please fill in all fields properly'), findsNothing);
    expect(find.text('OK'), findsNothing);
  });
}
