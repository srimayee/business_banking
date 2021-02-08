import 'package:business_banking/features/side_cash_enrollment/api/side_cash_enrollment_completion_service.dart';
import 'package:business_banking/features/side_cash_enrollment/bloc/side_cash_enrollment_completion_service_adapter.dart';
import 'package:business_banking/features/side_cash_enrollment/bloc/side_cash_get_enrollment_advertisment_service_adapter.dart';
import 'package:business_banking/features/side_cash_enrollment/bloc/side_cash_get_enrollment_form_service_adapter.dart';
import 'package:business_banking/features/side_cash_enrollment/model/enrollment_advertisement_entity.dart';
import 'package:business_banking/features/side_cash_enrollment/model/enrollment_advertisement_view_model.dart';
import 'package:business_banking/features/side_cash_enrollment/model/enrollment_completion_entity.dart';
import 'package:business_banking/features/side_cash_enrollment/model/enrollment_completion_view_model.dart';
import 'package:business_banking/features/side_cash_enrollment/model/enrollment_form_entity.dart';
import 'package:business_banking/features/side_cash_enrollment/model/enrollment_form_view_model.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework/clean_framework_defaults.dart';
import 'package:flutter/cupertino.dart';

import '../../../locator.dart';

class SideCashEnrollmentUsecase extends UseCase {
  Function(ViewModel) formViewModelCallBack;
  Function(ViewModel) advertisementViewModelCallback;
  Function(ViewModel) completionViewModelCallback;

  RepositoryScope _scope;

  // Test 1
  SideCashEnrollmentUsecase({
    @required this.formViewModelCallBack,
    @required this.advertisementViewModelCallback,
    @required this.completionViewModelCallback,
  }) : assert(
          formViewModelCallBack != null &&
              advertisementViewModelCallback != null &&
              completionViewModelCallback != null,
        );

  void advertisementNotifySubscribers(entity) {
    advertisementViewModelCallback(buildAdvertisementViewModel(entity));
  }

  void formNotifySubscribers(entity) {
    formViewModelCallBack(buildFormViewModel(entity));
  }

  void completionNotifySubscribers(entity) {
    completionViewModelCallback(buildCompletionViewModel(entity));
  }

  EnrollmentAdvertisementViewModel buildAdvertisementViewModel(
      EnrollmentAdvertisementEntity entity) {
    return EnrollmentAdvertisementViewModel(
      message: entity.message,
    );
  }

  EnrollmentFormViewModel buildFormViewModel(EnrollmentFormEntity entity) {
    return EnrollmentFormViewModel(
      accounts: entity.accounts,
      selectedAccount: entity.selectedAccount,
    );
  }

  EnrollmentCompletionViewModel buildCompletionViewModel(
      EnrollmentFormEntity entity) {
    return EnrollmentCompletionViewModel(
      isSuccess: entity.submissionSuccess,
      message: entity.submissionMessage,
    );
  }

  // DISPLAY ADVERTISEMENT
  void createAdvertisement() async {
    _scope = ExampleLocator()
        .repository
        .containsScope<EnrollmentAdvertisementEntity>();
    if (_scope == null) {
      final entity = EnrollmentAdvertisementEntity();
      _scope = ExampleLocator()
          .repository
          .create<EnrollmentAdvertisementEntity>(
              entity, advertisementNotifySubscribers);
    } else {
      // TODO Untested
      _scope.subscription = advertisementNotifySubscribers;
    }

    ExampleLocator().repository.runServiceAdapter(
        _scope, SideCashGetEnrollmentAdvertisementServiceAdapter());
  }

  // BEGIN ENROLLMENT
  void createForm() async {
    _scope = ExampleLocator().repository.containsScope<EnrollmentFormEntity>();

    if (_scope == null) {
      print("form scope == null");
      _scope = ExampleLocator().repository.create<EnrollmentFormEntity>(
          EnrollmentFormEntity(),
          formNotifySubscribers); // TODO What do I do If I have no data to provide for required params?
    } else {
      print("form scope != null");
      _scope.subscription = formNotifySubscribers;
    }
    await ExampleLocator()
        .repository
        .runServiceAdapter(_scope, SideCashGetEnrollmentFormServiceAdapter());
  }

  //
  void updateFormWithSelectedAccount(String account) {
    print("in updateFormWithSelectedAccount");
    _scope = ExampleLocator().repository.containsScope<EnrollmentFormEntity>();
    final enrollmentForm =
        ExampleLocator().repository.get<EnrollmentFormEntity>(_scope);
    final updatedForm = enrollmentForm.merge(selectedAccount: account);

    ExampleLocator()
        .repository
        .update<EnrollmentFormEntity>(_scope, updatedForm);
    formNotifySubscribers(updatedForm);
  }

  void submitEnrollmentForm({EnrollmentFormEntity testEntity}) async {
    _scope = ExampleLocator().repository.containsScope<EnrollmentFormEntity>();
    // final enrollmentForm =
    //     ExampleLocator().repository.get<EnrollmentFormEntity>(_scope);

    // TODO UNTESTED - If statement should never occur, do I need to account for it?
    if (_scope == null) {
      _scope = ExampleLocator().repository.create<EnrollmentFormEntity>(
           EnrollmentFormEntity(selectedAccount: "test account"),
          completionNotifySubscribers); // TODO What do I do If I have no data to provide for required params?
    } else {
      _scope.subscription = completionNotifySubscribers;
    }

    await ExampleLocator().repository.runServiceAdapter(
        _scope, SideCashEnrollmentCompletionServiceAdapter());
  }
}



