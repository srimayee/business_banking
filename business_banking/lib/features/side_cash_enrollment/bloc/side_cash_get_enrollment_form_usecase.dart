import 'package:business_banking/features/side_cash_enrollment/bloc/side_cash_get_enrollment_advertisment_service_adapter.dart';
import 'package:business_banking/features/side_cash_enrollment/bloc/side_cash_get_enrollment_form_service_adapter.dart';
import 'package:business_banking/features/side_cash_enrollment/model/enrollment_advertisement_entity.dart';
import 'package:business_banking/features/side_cash_enrollment/model/enrollment_advertisement_view_model.dart';
import 'package:business_banking/features/side_cash_enrollment/model/enrollment_form_entity.dart';
import 'package:business_banking/features/side_cash_enrollment/model/enrollment_form_view_model.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework/clean_framework_defaults.dart';
import 'package:flutter/cupertino.dart';

import '../../../locator.dart';

class SideCashEnrollmentUsecase extends UseCase {
  Function(ViewModel) formViewModelCallBack;
  Function(ViewModel) advertisementViewModelCallback;
  RepositoryScope _scope;
  ExampleLocator locator;
  Function() getRepoScope;
  RepositoryScope Function() createScope;

  // Test 1
  SideCashEnrollmentUsecase({
    @required this.formViewModelCallBack,
    @required this.advertisementViewModelCallback,
    @required this.getRepoScope,
    this.createScope,
    // Locator locator,
    // this.scope,
  }) : assert(formViewModelCallBack != null &&
            advertisementViewModelCallback != null);

  // this.createScope = ()=> ExampleLocator().repository.create(EnrollmentFormEntity(accounts: [], firstAvailableStartDate: null), viewModelCallBack);

  void advertisementNotifySubscribers(entity) {
    advertisementViewModelCallback(buildAdvertisementViewModel(entity));
  }

  void formNotifySubscribers(entity) {
    formViewModelCallBack(buildFormViewModel(entity));
  }

  EnrollmentAdvertisementViewModel buildAdvertisementViewModel(
      EnrollmentAdvertisementEntity entity) {
    return EnrollmentAdvertisementViewModel(message: entity.message);
  }

  EnrollmentFormViewModel buildFormViewModel(EnrollmentFormEntity entity) {
    print("entity: $entity");
    return EnrollmentFormViewModel(
      accounts: entity.accounts,
      selectedStartDate: entity.selectedStartDate,
      selectedAccount: entity.selectedAccount,
      firstAvailableStartDate: entity.firstAvailableStartDate,
    );
  }

  //
  // buildViewModel(EnrollmentFormEntity entity) {
  //   return EnrollmentFormViewModel(
  //     accounts: entity.accounts,
  //     firstAvailableStartDate: entity.firstAvailableStartDate,
  //     selectedStartDate: entity.selectedStartDate,
  //     selectedAccount: entity.selectedAccount,
  //   );
  // }
  //
  fetchFormData() async {
    // _scope = ExampleLocator()
    //     .repository
    //     .create<EnrollmentFormEntity>(
    //     EnrollmentFormEntity(), notifySubscribers);
    //TODO Try RepositoryScope _scope = repo().containsScope<EnrollmentFormEntity>();
    if (_scope != null) {
      // create scope
    } else {
      // attach notify subscribers to scope
    }

// TODO Try await repo().runServiceAdapter<EnrollmentFormEntity>(_scope);
  }

  //
  // void createAdvertisement()async {
  //   // TODO STEP 1
  //   _scope = ExampleLocator().repository.containsScope<EnrollmentAdvertisementEntity>();
  //   if (_scope == null) {
  //
  //     _scope = ExampleLocator().repository.create<EnrollmentAdvertisementEntity>(
  //         EnrollmentAdvertisementEntity(message: "yo"),
  //         advertisementNotifySubscribers); // TODO What do I do If I have no data to provide for required params?
  //
  //   } else {
  //
  //     _scope.subscription = advertisementNotifySubscribers;
  //   }
  //
  //   await ExampleLocator()
  //       .repository
  //       .runServiceAdapter(_scope, SideCashGetEnrollmentAdvertisementServiceAdapter());
  // }

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
      _scope.subscription = advertisementNotifySubscribers;
    }

    ExampleLocator().repository.runServiceAdapter(
        _scope, SideCashGetEnrollmentAdvertisementServiceAdapter());
  }

  void createForm() async {
    _scope = ExampleLocator().repository.containsScope<EnrollmentFormEntity>();

    if (_scope == null) {

      _scope = ExampleLocator().repository.create<EnrollmentFormEntity>(
          EnrollmentFormEntity(),
          formNotifySubscribers); // TODO What do I do If I have no data to provide for required params?
    } else {
      _scope.subscription = formNotifySubscribers;
    }
    await ExampleLocator()
        .repository
        .runServiceAdapter(_scope, SideCashGetEnrollmentFormServiceAdapter());
  }
}
