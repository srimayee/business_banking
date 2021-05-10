// @dart=2.9
import 'package:business_banking/features/online_registration/bloc/online_registration_bloc.dart';
import 'package:business_banking/features/online_registration/ui/online_registration_form_entry/online_registration_presenter.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../bloc/online_registration_form_entry/online_registration_bloc_mock.dart';

class MockBuildContext extends Mock implements BuildContext {}

void main() {
  MaterialApp testWidget;
  OnlineRegistrationBlocMock mockBloc;
  OnlineRegistrationPresenter presenter;
  setUp(() {
    mockBloc = OnlineRegistrationBlocMock();
    presenter = OnlineRegistrationPresenter();

    testWidget = MaterialApp(
      home: BlocProvider<OnlineRegistrationBloc>(
        create: (_) => mockBloc,
        child: presenter,
      ),
    );
  });
  tearDown(() {
    mockBloc = null;
    testWidget = null;
  });
  group('Create New account online', () {
    testWidgets('should show the presenter', (tester) async {
      await tester.pumpWidget(testWidget);
      await tester.pump(Duration(milliseconds: 500));
      final widgetType = find.byType(OnlineRegistrationPresenter);
      expect(widgetType, findsOneWidget);
    });
  });
}
