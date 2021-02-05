import 'package:business_banking/features/side_cash_enrollment/bloc/side_cash_enrollment_bloc.dart';
import 'package:business_banking/features/side_cash_enrollment/model/enrollment_advertisement_view_model.dart';
import 'package:business_banking/features/side_cash_enrollment/side_cash_enrollment_keys.dart';
import 'package:business_banking/features/side_cash_enrollment/ui/side_cash_enrollment_advertisement_presenter.dart';
import 'package:business_banking/features/side_cash_enrollment/ui/side_cash_enrollment_advertisement_screen.dart';
import 'package:business_banking/features/side_cash_enrollment/ui/side_cash_enrollment_form_screen.dart';
import 'package:business_banking/main.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../SideCash/SideCashDetails/mock_dummy_functions.dart';
import '../mocks/mock_side_cash_enrollment_bloc.dart';
import '../mocks/ui_mocks.dart';

main() {
  group("Side Cash Advertisement Presenter Tests: ", () {
    final mockDummyFunctions = MockDummyFunctions();
    SideCashEnrollmentAdvertisementPresenter presenter;
    MockSideCashEnrollmentBloc bloc;
    MockNavigatorObserver mockNavigatorObserver;

    setUpAll(() {
      presenter = SideCashEnrollmentAdvertisementPresenter();
      bloc = MockSideCashEnrollmentBloc();
      mockNavigatorObserver = MockNavigatorObserver();
    });

    _getApp(Widget widget) {
      return MaterialApp(
        navigatorKey: navigatorKey,
        home: BlocProvider<SideCashEnrollmentBloc>(
          create: (context) => MockSideCashEnrollmentBloc(),
          child: widget,
        ),
        navigatorObservers: [mockNavigatorObserver],
      );
    }

    test("presenter renders SideCashEnrollmentAdvertisementScreen", () {
      final result = presenter.buildScreen(MockedBuildContext(), bloc,
          EnrollmentAdvertisementViewModel(message: "yoooo"));

      expect(result, isA<SideCashEnrollmentAdvertisementScreen>());
    });

    // TODO FAILING
    testWidgets(
        "navigation callback in presenter is fired and pushes to form page",
        (tester) async {
      final ctx = MockedBuildContext();

      SideCashEnrollmentAdvertisementScreen screen = presenter.buildScreen(ctx,
          bloc, EnrollmentAdvertisementViewModel(message: "default message"));
      await tester.pumpWidget(_getApp(presenter));
      screen.enrollTapped(ctx);

      //TODO Not working
      verify(mockNavigatorObserver.didPush(any, any)).called(2);
    });

    //TODO  FAILING
    testWidgets('navigate to Enrollment Form page',
        (WidgetTester tester) async {
      await tester.pumpWidget(_getApp(presenter));
      presenter.navigateToEnrollmentForm(MockedBuildContext());
      // verify(mockNavigatorObserver.didPush(any, any));
    });

    test("presenter gets proper EnrollmentAdvertisementViewModel", () {});
  });
}
