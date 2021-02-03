import 'package:business_banking/features/side_cash_enrollment/bloc/side_cash_enrollment_bloc.dart';
import 'package:business_banking/features/side_cash_enrollment/model/enrollment_form_view_model.dart';
import 'package:business_banking/features/side_cash_enrollment/ui/side_cash_enrollment_form_presenter.dart';
import 'package:business_banking/features/side_cash_enrollment/ui/side_cash_enrollment_form_screen.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../mocks/data_and_function_mocks.dart';
import '../mocks/mock_side_cash_enrollment_bloc.dart';
import '../mocks/ui_mocks.dart';

main() {
  //1 Verify the presenter calls Bloc listeners/Streams..?
  // Call presenter.buildScreen
  // Provide a mocked bloc

  // Todo TESTS
  // verify navigation occurs and Actions on the bloc are verified

  // presenter.getViewModelStream
  // verify this mocked stream is listened to
  // presenter.updateSelectedAccount
  // verify this mocked stream is fed data
  // presenter.updateSelectedStartDate
  // verify this mocked stream is fed data
  // presenter.submitForm
  //    -> checks if data is valid
  //      -> tells bloc to submit form
  //      -> or tells presenter to show error dialog

  group("side cash enrollment form presenter tests", () {
    SideCashEnrollmentFormPresenter presenter;
    MockSideCashEnrollmentBloc bloc;
    MockNavigatorObserver mockNavigatorObserver;

    setUpAll(() {
      presenter = SideCashEnrollmentFormPresenter();
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

    test("presenter renders SideCashEnrollmentFormScreen", () {
      final result = presenter.buildScreen(
          MockedBuildContext(), bloc, EnrollmentFormViewModel());

      expect(result, isA<SideCashEnrollmentFormScreen>());
    });

    // TODO Come back to this
    testWidgets("update selectedCheckingAccount callback in presenter is fired",
        (tester) async {
      MockDummyFunctions dumbFunctions = MockDummyFunctions();
      final ctx = MockedBuildContext();
      final presenter = SideCashEnrollmentFormPresenter(
        testUpdatedSelectedAccount: dumbFunctions.updateSelectedAccountWrapper,
      );

      SideCashEnrollmentFormScreen screen =
          presenter.buildScreen(ctx, bloc, EnrollmentFormViewModel());
      await tester.pumpWidget(_getApp(presenter));

      // TODO NEXT
      //  HOW TO FIND Button and tap button to call update selectedCheckingAccount callback

      screen.updateSelectedAccount("A string, ya know");

      await tester.pumpAndSettle();
      // screen.enrollTapped(ctx);
      verify(dumbFunctions.updateSelectedAccount(any)).called(1);
    });
  });
}
