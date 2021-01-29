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

class SideCashGetEnrollmentFormUsecase extends UseCase {
  Function(ViewModel) formViewModelCallBack;
  Function(ViewModel) advertisementViewModelCallback;
  RepositoryScope _scope;
  ExampleLocator locator;
  Function() getRepoScope;
  RepositoryScope Function() createScope;

  // Test 1
  SideCashGetEnrollmentFormUsecase({
    @required this.formViewModelCallBack,
    @required this.advertisementViewModelCallback,
    @required this.getRepoScope,
    this.createScope,
    // Locator locator,
    // this.scope,
  }) : assert(formViewModelCallBack != null && advertisementViewModelCallback != null);

  // this.createScope = ()=> ExampleLocator().repository.create(EnrollmentFormEntity(accounts: [], firstAvailableStartDate: null), viewModelCallBack);

  void formNotifySubscribers(entity) {
    // Test 2
    formViewModelCallBack(buildViewModel(entity));
  }

  void advertisementNotifySubscribers(entity) {
    print("entity: $entity");
    print("message: ${entity.message}");
    advertisementViewModelCallback(EnrollmentAdvertisementViewModel(message: entity.message));
  }

  buildViewModel(EnrollmentFormEntity entity) {
    return EnrollmentFormViewModel(
      accounts: entity.accounts,
      firstAvailableStartDate: entity.firstAvailableStartDate,
      selectedStartDate: entity.selectedStartDate,
      selectedAccount: entity.selectedAccount,
    );
  }

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

  void createAdvertisement()async {
    // TODO STEP 1
    _scope = ExampleLocator().repository.containsScope<EnrollmentAdvertisementEntity>();
    if (_scope == null) {

      _scope = ExampleLocator().repository.create<EnrollmentAdvertisementEntity>(
          EnrollmentAdvertisementEntity(message: "yo"),
          advertisementNotifySubscribers); // TODO What do I do If I have no data to provide for required params?

    } else {

      _scope.subscription = advertisementNotifySubscribers;
    }

    await ExampleLocator()
        .repository
        .runServiceAdapter(_scope, SideCashGetEnrollmentAdvertisementServiceAdapter());
  }

  // Test 3 TODO HOW TO TEST that this is build correctly?
  void create() async {
    // TODO STEP 1
    _scope = ExampleLocator().repository.containsScope<EnrollmentFormEntity>();
    // _scope = getRepoScope();

    if (_scope == null) {
      print("scope is null");

      // HOW TO pass notify subscribers (and maybe entity back)
      // What about type definitions?

      //TODO (could just use view model callback)

      // TODO STEP 2
      _scope = ExampleLocator().repository.create<EnrollmentFormEntity>(
          EnrollmentFormEntity(),
          formNotifySubscribers); // TODO What do I do If I have no data to provide for required params?
      // _scope = createScope();
      print("called createScope");
    } else {
      print("scope is not null, setting notify subscribers");
      //TODO How to track this from the tests

      // TODO ALTERNATE STEP 2
      _scope.subscription = formNotifySubscribers;
    }
    //
    // // TODO Ideally I believe this will only ever get run once...? maybe call this at end of IF Statement
    //
    //
    // // TODO SHOULD NOW CREATE SERVICE ADAPTER

    // TODO STEP 3
    await ExampleLocator()
        .repository
        .runServiceAdapter(_scope, SideCashGetEnrollmentFormServiceAdapter());
  }
}
