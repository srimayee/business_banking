import 'package:business_banking/features/side_cash_enrollment/bloc/side_cash_enrollment_bloc.dart';
import 'package:business_banking/features/side_cash_enrollment/model/enrollment_advertisement_view_model.dart';
import 'package:business_banking/features/side_cash_enrollment/ui/side_cash_enrollment_advertisement/side_cash_enrollment_advertisement_presenter.dart';
import 'package:business_banking/features/side_cash_enrollment/ui/side_cash_enrollment_advertisement/side_cash_enrollment_advertisement_screen.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../SideCash/SideCashDetails/mock_dummy_functions.dart';
import '../../mocks/mock_side_cash_enrollment_bloc.dart';
import '../../mocks/ui_mocks.dart';

main() {
  group("Presenter Tests: ", () {
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
        // navigatorKey: navigatorKey,
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

    testWidgets("test listeners are fired", (tester) async {
      MockDummyFunctions dumbFunctions = MockDummyFunctions();
      final ctx = MockedBuildContext();
      final presenter =
      SideCashEnrollmentAdvertisementPresenter(
        navigateToEnrollmentForm:
            dumbFunctions.navigate(ctx),
      );

      SideCashEnrollmentAdvertisementScreen screen = presenter.buildScreen(
          ctx, bloc, EnrollmentAdvertisementViewModel(message: "default message"));
      await tester.pumpWidget(_getApp(presenter));
      screen.enrollTapped(ctx);
      verify(dumbFunctions.navigate(ctx)).called(1);
      // verify(mockNavigatorObserver.didPush(any, any)).called(1);
    });

    test("presenter gets proper EnrollmentAdvertisementViewModel", () {});

    test("navigate to EnrollmentForm occurs", () {});
  });
}
