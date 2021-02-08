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

  group("side cash enrollment form presenter tests: ", () {
    SideCashEnrollmentFormPresenter presenter;
    MockSideCashEnrollmentBloc mockBloc;
    MockNavigatorObserver mockNavigatorObserver;

    setUpAll(() {
      presenter = SideCashEnrollmentFormPresenter();
      mockBloc = MockSideCashEnrollmentBloc();
      mockNavigatorObserver = MockNavigatorObserver();
    });

    _getApp(Widget widget) {
      return TestableWidgetWrapper(
        BlocProvider<SideCashEnrollmentBloc>(
            create: (context) => MockSideCashEnrollmentBloc(), child: widget),
      );
      // return MaterialApp(
      //   // navigatorKey: navigatorKey,
      //   home: Builder(
      //     builder: (context) => BlocProvider<SideCashEnrollmentBloc>(
      //         create: (context) => MockSideCashEnrollmentBloc(), child: widget),
      //   ),
      //   navigatorObservers: [mockNavigatorObserver],
      // );
    }

    test("presenter renders SideCashEnrollmentFormScreen", () {
      final result = presenter.buildScreen(
          MockedBuildContext(), mockBloc, initialFormViewModel());

      expect(result, isA<SideCashEnrollmentFormScreen>());
    });

    // TODO FAILING
    testWidgets(
        "update selectedCheckingAccount callback in presenter fires off the listener in the bloc",
        (tester) async {
      MockDummyFunctions dumbyFunctions = MockDummyFunctions();

      // final ctx = MockedBuildContext();

      final presenter = SideCashEnrollmentFormPresenter(
        testUpdatedSelectedAccount: dumbyFunctions.updateSelectedAccountWrapper,
      );

      await tester.pumpWidget(_getApp(presenter));

      // SideCashEnrollmentFormScreen screen =
      //     presenter.buildScreen(ctx, mockBloc, initialFormViewModel());
      // await tester.pumpAndSettle();

      presenter.updateSelectedAccount("test account string", mockBloc);
      await tester.pumpAndSettle();

      verify(mockBloc.updateFormWithSelectedAccountListener(any)).called(1);
    });

    // TODO UNTESTED - actually  verify navigation occurs
    test("submit form and navigate gets called in presenter", () {
      MockDummyFunctions dumbFunctions = MockDummyFunctions();
      final ctx = MockedBuildContext();
      final presenter = SideCashEnrollmentFormPresenter(
        testSubmitFormAndNavigate: dumbFunctions.submitFormAndNavigate,
      );

      SideCashEnrollmentFormScreen screen = presenter.buildScreen(
          ctx, mockBloc, EnrollmentFormViewModel(accounts: ["1", "2"]));

      screen.submitForm(ctx);

      verify(dumbFunctions.submitFormAndNavigate(any, any));
    });

    // TODO FAILING
    testWidgets("submit form navigates if view model selected account != null",
        (tester) async {

          final presenter = SideCashEnrollmentFormPresenter();
          final ctx = MockedBuildContext();

          await tester.pumpWidget(
            MaterialApp(
              home: BlocProvider<SideCashEnrollmentBloc>(
                create: (context) => MockSideCashEnrollmentBloc(),
                child: presenter,
              ),
              navigatorObservers: [mockNavigatorObserver],
            ),
          );
      //
      // final presenter = SideCashEnrollmentFormPresenter();

      // await tester.pumpWidget(_getApp(presenter));

       SideCashEnrollmentFormScreen screen = presenter.buildScreen(ctx, mockBloc,
          EnrollmentFormViewModel(accounts: ["1", "2"], selectedAccount: "2"));
      await tester.pumpAndSettle();

          print("before presenter.submitFormAndNavigate");
      // await presenter.submitFormAndNavigate(ctx,
      //     EnrollmentFormViewModel(selectedAccount: "2", accounts: ["1", "2"]));
        await   screen.submitForm(ctx);
      await tester.pumpAndSettle();

      print("before verify");
      verify(mockNavigatorObserver.didPush(any, any)).called(2);
    });

    // TODO FAILING
    testWidgets(
        "submit form DOESNT navigate if view model selected account == null",
        (tester) async {
      final presenter = SideCashEnrollmentFormPresenter();

      final mockObserver = MockNavigatorObserver();
      await tester.pumpWidget(
        MaterialApp(
          home: Builder(
            builder: (ctx) =>  BlocProvider<SideCashEnrollmentBloc>(
              create: (context) => MockSideCashEnrollmentBloc(),
              child: presenter,
            ),
          ),
          navigatorObservers: [mockNavigatorObserver],
        ),
      );

      final ctx = MockedBuildContext();

      await tester.pumpWidget(_getApp(presenter));

      SideCashEnrollmentFormScreen screen = presenter.buildScreen(ctx, mockBloc,
          EnrollmentFormViewModel(accounts: ["1", "2"], selectedAccount: null));
      await tester.pumpAndSettle();

      presenter.submitFormAndNavigate(MockedBuildContext(),
          EnrollmentFormViewModel(selectedAccount: null, accounts: ["1", "2"]));
      // await tester.pumpAndSettle();

      // expect(find.byKey(Key("enrollmentFormSubmitErrorDialog")),
      //     isA<AlertDialog>());
      // verify(mockNavigatorObserver.didPush(any, any)).called(1);
    });
  });
}
