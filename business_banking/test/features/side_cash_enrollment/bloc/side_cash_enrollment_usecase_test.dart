import 'package:business_banking/features/side_cash_enrollment/bloc/side_cash_enrollment_usecase.dart';
import 'package:business_banking/features/side_cash_enrollment/model/enrollment_advertisement_entity.dart';
import 'package:business_banking/features/side_cash_enrollment/model/enrollment_advertisement_view_model.dart';
import 'package:business_banking/features/side_cash_enrollment/model/enrollment_completion_entity.dart';
import 'package:business_banking/features/side_cash_enrollment/model/enrollment_completion_view_model.dart';
import 'package:business_banking/features/side_cash_enrollment/model/enrollment_form_entity.dart';
import 'package:business_banking/features/side_cash_enrollment/model/enrollment_form_view_model.dart';
import 'package:clean_framework/clean_framework_defaults.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:clean_framework/clean_framework.dart';

import '../../../../lib/locator.dart';
import '../mocks/data_and_function_mocks.dart';

main() {
  group('Side Cash Enrollment usecase tests ', () {
    test("1: assert view model callbacks cannot be null in constructor",
        () async {
      try {
        SideCashEnrollmentUsecase();
      } catch (e) {
        expect(e, isAssertionError);
      }
    });

    test(
        "1: verify ADVERTISEMENT view model callback is invoked when notify subscribes is provided an enrollment ADVERTISEMENT entity",
        () {
      final mockDummyFunctions = MockDummyFunctions();
      final useCase = SideCashEnrollmentUsecase(
        advertisementViewModelCallback:
            mockDummyFunctions.advertisementVMCallback,
        formViewModelCallBack: mockDummyFunctions.formVMCallback,
        completionViewModelCallback: mockDummyFunctions.completionVMCallback,
      );

      useCase.advertisementNotifySubscribers(
          EnrollmentAdvertisementEntity(message: "gello"));
      verify(mockDummyFunctions.advertisementVMCallback(any)).called(1);

      useCase.formNotifySubscribers(EnrollmentFormEntity(accounts: ["", ""]));
      verify(mockDummyFunctions.formVMCallback(any)).called(1);

      useCase.completionNotifySubscribers(
          EnrollmentCompletionEntity(message: "", isSuccess: true));
      verify(mockDummyFunctions.completionVMCallback(any)).called(1);
    });

    // How do we include errors in the view model?
    test("3: build View Models for service will return error model ", () async {
      final mockDummyFunctions = MockDummyFunctions();
      final useCase = SideCashEnrollmentUsecase(
          formViewModelCallBack: mockDummyFunctions.formVMCallback,
          advertisementViewModelCallback:
              mockDummyFunctions.advertisementVMCallback);
      final advertisementEntity =
          EnrollmentAdvertisementEntity(errors: [EntityFailure()]);
      final result = useCase.buildAdvertisementViewModel(advertisementEntity);
      expect(result, isA<EnrollmentAdvertisementViewModel>());

      final formEntity = EnrollmentFormEntity(errors: [EntityFailure()]);
      final formResult = useCase.buildFormViewModel(formEntity);
      expect(formResult, isA<EnrollmentFormViewModel>());
    });

    // TODO What to test for the Create function?
    // TODO Create function does: 1) checks for scope, 2) IF null creates scope + sets notifySubscribers
    // TODO 3) ELSE just attaches notififySubscribers to scope, 4) Runs service adapter

    // test('3: usecase.create() calls view model callback', () async {
    //   final EnrollmentFormEntity entity = initialEntity();
    //   ExampleLocator().repository = Repository();
    //   ExampleLocator().repository.create<EnrollmentFormEntity>(entity, (_) {});
    //
    //   final mockDummyFunctions = MockDummyFunctions();
    //   final useCase = SideCashGetEnrollmentFormUsecase(mockDummyFunctions.voidCallback);
    //   //
    //   // useCase.create();
    //   // useCase.notifySubscribers(ScheduledPaymentsByMonthEntityModelList());
    //   // verify(mockDummyFunctions.voidCallBack(any)).called(1);
    // });

    test(
        "4: .buildFormViewModel accepts a Form Entity and returns a Form View Model",
        () {
      final mockDummyFunctions = MockDummyFunctions();

      final useCase = SideCashEnrollmentUsecase(
          formViewModelCallBack: mockDummyFunctions.formVMCallback,
          advertisementViewModelCallback:
              mockDummyFunctions.advertisementVMCallback);

      final EnrollmentFormEntity entity = initialFormEntity();

      expect(useCase.buildFormViewModel(entity), initialFormViewModel());
    });

    test(
        "4: .buildAdvertisementViewModel accepts a Advertisement Entity and returns a Advertisement View Model",
        () {
      final mockDummyFunctions = MockDummyFunctions();

      final useCase = SideCashEnrollmentUsecase(
          formViewModelCallBack: mockDummyFunctions.formVMCallback,
          advertisementViewModelCallback:
              mockDummyFunctions.advertisementVMCallback);

      final EnrollmentAdvertisementEntity entity = initialAdvertisementEntity();

      expect(useCase.buildAdvertisementViewModel(entity),
          initialAdvertisementViewModel());
    });

    test("buildViewModel returns proper VM for entities", () {
      final mockDummyFunctions = MockDummyFunctions();
      // final mockLocator = MockExampleLocator();
      final useCase = SideCashEnrollmentUsecase(
        formViewModelCallBack: mockDummyFunctions.formVMCallback,
        advertisementViewModelCallback:
            mockDummyFunctions.advertisementVMCallback,
      );
      expect(
          useCase.buildCompletionViewModel(
              EnrollmentCompletionEntity(message: "test", isSuccess: true)),
          EnrollmentCompletionViewModel(message: "test", isSuccess: true));
    });

    test('5: View Model builds with Service Errors', () async {
      final mockDummyFunctions = MockDummyFunctions();
      final useCase = SideCashEnrollmentUsecase(
          formViewModelCallBack: mockDummyFunctions.formVMCallback,
          advertisementViewModelCallback:
              mockDummyFunctions.advertisementVMCallback);

      EnrollmentFormEntity entity = initialFormEntity()
        ..merge(errors: [NoConnectivityEntityFailure(), EntityFailure()]);

      // final result = useCase.buildViewModel(entity);
      // expect(result, isA<EnrollmentFormViewModel>());
    });

    test("6: View Model builds with input data", () {
      final mockDummyFunctions = MockDummyFunctions();
      final useCase = SideCashEnrollmentUsecase(
          formViewModelCallBack: mockDummyFunctions.formVMCallback,
          advertisementViewModelCallback:
              mockDummyFunctions.advertisementVMCallback);

      EnrollmentFormEntity entity = initialFormEntity()
        ..merge(
            selectedAccount: "checking-234", selectedStartDate: DateTime.now());

      // final result = useCase.buildViewModel(entity);
      // expect(result, isA<EnrollmentFormViewModel>());
    });

    test(
        "8: Usecase create goes into IF statement to create NEW SCOPE when getRepositoryScope returns null",
        () {
      //   final mockDummyFunctions = MockDummyFunctions();
      //   // final mockLocator = MockExampleLocator();
      //   final useCase = SideCashGetEnrollmentFormUsecase(
      //     viewModelCallBack: mockDummyFunctions.voidCallback,
      //     getRepoScope: mockDummyFunctions.getRepoScope,
      //     createScope: () =>
      //         mockDummyFunctions.createScope(mockDummyFunctions.voidCallback),
      //   );
      //
      //   // when(mockDummyFunctions.getRepoSope()).thenAnswer( null);
      //
      //   useCase.create();
      //   verify(mockDummyFunctions.getRepoScope()).called(1);
      //   verify(mockDummyFunctions.createScope(any)).called(1);
      //   verify(mockDummyFunctions.voidCallback(any)).called(1);
      //   verifyNoMoreInteractions(mockDummyFunctions);
    });
    //
    test(
        "9: Usecase create goes into ELSE statement to set NotifySubscribers to scope's .subscription if getRepositoryScope returns scope ",
        () {
      //   final mockDummyFunctions = MockDummyFunctions();
      //   // final mockLocator = MockExampleLocator();
      //   final useCase = SideCashGetEnrollmentFormUsecase(
      //     viewModelCallBack: mockDummyFunctions.voidCallback,
      //     getRepoScope: mockDummyFunctions.getRepoScope,
      //     createScope: () => mockDummyFunctions.createScope(() {
      //       mockDummyFunctions.voidCallback(ViewModel);
      //     }),
      //   );
      //
      //   when(mockDummyFunctions.getRepoScope()).thenReturn(RepositoryScope(any));
      //
      //   useCase.create();
      //   verify(mockDummyFunctions.getRepoScope()).called(1);
      //   verify(mockDummyFunctions
      //           .createScope(mockDummyFunctions.voidCallback(ViewModel)))
      //       .called(0);
      //   verifyNoMoreInteractions(mockDummyFunctions);
    });
  });
}
