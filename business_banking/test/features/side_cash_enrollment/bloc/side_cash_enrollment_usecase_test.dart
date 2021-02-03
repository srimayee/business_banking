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
        "1: verify view model callback is invoked when notify subscribes is provided an enrollment ADVERTISEMENT entity",
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
          EnrollmentFormEntity());
      verify(mockDummyFunctions.completionVMCallback(any)).called(1);
    });

    // How do we include errors in the view model?
    test("3: build View Models for service will return error model ", () async {
      final mockDummyFunctions = MockDummyFunctions();
      final useCase = SideCashEnrollmentUsecase(
          formViewModelCallBack: mockDummyFunctions.formVMCallback,
          completionViewModelCallback: mockDummyFunctions.completionVMCallback,
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


    test(
        "4: .buildFormViewModel accepts a Form Entity and returns a Form View Model",
        () {
      final mockDummyFunctions = MockDummyFunctions();

      final useCase = SideCashEnrollmentUsecase(
          formViewModelCallBack: mockDummyFunctions.formVMCallback,
          completionViewModelCallback: mockDummyFunctions.completionVMCallback,
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
              mockDummyFunctions.advertisementVMCallback,   completionViewModelCallback: mockDummyFunctions.completionVMCallback);

      final EnrollmentAdvertisementEntity entity = initialAdvertisementEntity();

      expect(useCase.buildAdvertisementViewModel(entity),
          initialAdvertisementViewModel());
    });

    test("buildCompletionViewModel returns proper VM for entities", () {
      final mockDummyFunctions = MockDummyFunctions();
      // final mockLocator = MockExampleLocator();
      final useCase = SideCashEnrollmentUsecase(
        formViewModelCallBack: mockDummyFunctions.formVMCallback,
        advertisementViewModelCallback:
            mockDummyFunctions.advertisementVMCallback,
        completionViewModelCallback: mockDummyFunctions.completionVMCallback,
      );
      expect(
          useCase.buildCompletionViewModel(
              EnrollmentFormEntity(submissionMessage: "test", submissionSuccess: true)),
          EnrollmentCompletionViewModel(message: "test", isSuccess: true));
    });

    test('5: Form View Model builds with Service Errors', () async {
      final mockDummyFunctions = MockDummyFunctions();
      final useCase = SideCashEnrollmentUsecase(
          formViewModelCallBack: mockDummyFunctions.formVMCallback,
           completionViewModelCallback: mockDummyFunctions.completionVMCallback,
          advertisementViewModelCallback:
              mockDummyFunctions.advertisementVMCallback);

      EnrollmentFormEntity entity = initialFormEntity()
        ..merge(errors: [NoConnectivityEntityFailure(), EntityFailure()]);

      final result = useCase.buildFormViewModel(entity);
      expect(result, isA<EnrollmentFormViewModel>());
    });


  });
}
