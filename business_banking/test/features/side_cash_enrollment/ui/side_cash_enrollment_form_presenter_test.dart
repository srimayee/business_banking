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
        home: Builder(
          builder: (context) => BlocProvider<SideCashEnrollmentBloc>(
              create: (context) => MockSideCashEnrollmentBloc(), child: widget),
        ),
        navigatorObservers: [mockNavigatorObserver],
      );
    }

    test("presenter renders SideCashEnrollmentFormScreen", () {
      final result = presenter.buildScreen(
          MockedBuildContext(), bloc, initialFormViewModel());

      expect(result, isA<SideCashEnrollmentFormScreen>());
    });

    testWidgets(
        "update selectedCheckingAccount callback in presenter fires off the listener in the bloc",
        (tester) async {
      MockDummyFunctions dumbFunctions = MockDummyFunctions();
      final ctx = MockedBuildContext();
      final presenter = SideCashEnrollmentFormPresenter(
        testUpdatedSelectedAccount: dumbFunctions.updateSelectedAccountWrapper,
      );

      await tester.pumpWidget(_getApp(presenter));

      SideCashEnrollmentFormScreen screen =
          presenter.buildScreen(ctx, bloc, initialFormViewModel());
      await tester.pumpAndSettle();
      presenter.updateSelectedAccount("test account string", bloc);
      await tester.pumpAndSettle();

      verify(bloc.updateFormWithSelectedAccountListener(any)).called(1);
    });

    // TODO Function injection doesnt seem to solve anything
    test("submit form and navigate gets called in presenter", () {
      MockDummyFunctions dumbFunctions = MockDummyFunctions();
      final ctx = MockedBuildContext();
      final presenter = SideCashEnrollmentFormPresenter(
        testSubmitFormAndNavigate: dumbFunctions.submitFormAndNavigate,
      );

      SideCashEnrollmentFormScreen screen = presenter.buildScreen(
          ctx, bloc, EnrollmentFormViewModel(accounts: ["1", "2"]));

      screen.submitForm(ctx);

      verify(dumbFunctions.submitFormAndNavigate(any, any));
    });

    testWidgets("submit form navigates if view model selected account != null",
        (tester) async {
      final ctx = MockedBuildContext();
      final presenter = SideCashEnrollmentFormPresenter();

      await tester.pumpWidget(_getApp(presenter));

      SideCashEnrollmentFormScreen screen = presenter.buildScreen(ctx, bloc,
          EnrollmentFormViewModel(accounts: ["1", "2"], selectedAccount: "2"));
      await tester.pumpAndSettle();

      presenter.submitFormAndNavigate(ctx,
          EnrollmentFormViewModel(selectedAccount: "2", accounts: ["1", "2"]));
      await tester.pumpAndSettle();

      verify(mockNavigatorObserver.didPush(any, any)).called(1);
    });

    testWidgets(
        "submit form DOESNT navigate if view model selected account == null",
        (tester) async {
      final ctx = MockedBuildContext();
      final presenter = SideCashEnrollmentFormPresenter();

      await tester.pumpWidget(_getApp(presenter));

      // SideCashEnrollmentFormScreen screen = presenter.buildScreen(ctx, bloc,
      //     EnrollmentFormViewModel(accounts: ["1", "2"], selectedAccount: null));
      // await tester.pumpAndSettle();

      presenter.submitFormAndNavigate(ctx,
          EnrollmentFormViewModel(selectedAccount: null, accounts: ["1", "2"]));
      // await tester.pumpAndSettle();

      expect(find.byKey(Key("enrollmentFormSubmitErrorDialog")),
          isA<AlertDialog>());
      // verify(mockNavigatorObserver.didPush(any, any)).called(1);
    });
  });
}
