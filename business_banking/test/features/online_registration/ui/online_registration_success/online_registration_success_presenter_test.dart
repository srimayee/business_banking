// @dart=2.9
import 'package:business_banking/features/online_registration/bloc/online_registration_bloc.dart';
import 'package:business_banking/features/online_registration/ui/online_registration_success_screen/online_registration_success_presenter.dart';
import 'package:business_banking/features/online_registration/ui/online_registration_success_screen/online_registration_success_widget.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../bloc/online_registration_form_entry/online_registration_bloc_mock.dart';

void main() {
  MaterialApp testWidget;
  setUp(() {
    testWidget = MaterialApp(
      home: BlocProvider<OnlineRegistrationBloc>(
        create: (_) => OnlineRegistrationBlocMock(),
        child: OnlineRegistrationSuccessWidget(),
      ),
    );
  });

  group('OnlineRegistration Succeeded', () {
    testWidgets('should show the presenter', (tester) async {
      await tester.pumpWidget(testWidget);
      await tester.pump(Duration(milliseconds: 500));
      final widgetType = find.byType(OnlineRegistrationSuccessPresenter);
      expect(widgetType, findsOneWidget);
    });
  });
}
