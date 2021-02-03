import 'package:business_banking/features/side_cash_enrollment/bloc/side_cash_enrollment_bloc.dart';
import 'package:business_banking/features/side_cash_enrollment/model/enrollment_completion_view_model.dart';
import 'package:business_banking/features/side_cash_enrollment/ui/side_cash_enrollment_completion_presenter.dart';
import 'package:business_banking/features/side_cash_enrollment/ui/side_cash_enrollment_completion_screen.dart';
import 'package:business_banking/main.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../SideCash/SideCashDetails/mock_dummy_functions.dart';
import '../mocks/mock_side_cash_enrollment_bloc.dart';
import '../mocks/ui_mocks.dart';

main() {
  group("Side Cash Enrollment Presenter Tests: ", () {
    SideCashEnrollmentCompletionPresenter presenter;
    MockSideCashEnrollmentBloc bloc;
    MockNavigatorObserver mockNavigatorObserver;

    setUpAll(() {
      presenter = SideCashEnrollmentCompletionPresenter();
      bloc = MockSideCashEnrollmentBloc();
      mockNavigatorObserver = MockNavigatorObserver();
    });

    _getApp(Widget widget) {
      return MaterialApp(
        navigatorKey: navigatorKey,
        home: Builder(
          builder: (context) => BlocProvider<SideCashEnrollmentBloc>(
            create: (context) => MockSideCashEnrollmentBloc(),
            child: widget,
          ),
        ),
        navigatorObservers: [mockNavigatorObserver],
      );
    }

    test("presenter renders SideCashEnrollmentCompletionScreen", () {
      final result = presenter.buildScreen(MockedBuildContext(), bloc,
          EnrollmentCompletionViewModel(message: "yoooo"));

      expect(result, isA<SideCashEnrollmentCompletionScreen>());
    });

    testWidgets('navigate to Enrollment Form page', (WidgetTester tester) async {
      await tester.pumpWidget(_getApp(presenter));
      presenter.exitFeature(MockedBuildContext());
      verify(mockNavigatorObserver.didPush(any, any)).called(2);
    });


    // // TODO AMR QUESTION
    // testWidgets("navigation callback in presenter is fired", (tester) async {
    //   MockDummyFunctions dumbFunctions = MockDummyFunctions();
    //   final ctx = MockedBuildContext();
    //   final presenter = SideCashEnrollmentCompletionPresenter(
    //     testExitFeature: dumbFunctions.navigate,
    //   );
    //
    //   SideCashEnrollmentCompletionScreen screen = presenter.buildScreen(
    //       ctx, bloc, EnrollmentCompletionViewModel(message: "default message"));
    //   await tester.pumpWidget(_getApp(presenter));
    //   screen.exitFeature(ctx);
    //
    //   //TODO Not working
    //   verify(dumbFunctions.navigate(any)).called(1);
    //   // verify(mockNavigatorObserver.didPush(any, any)).called(1);
    // });

    test("presenter gets proper EnrollmentCompletionViewModel", () {});
  });
}
