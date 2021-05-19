import 'package:business_banking/features/new_online_registration_form/bloc/new_online_registration_form_entry/new_online_registration_service_adapter.dart';
import 'package:business_banking/features/new_online_registration_form/model/new_online_registration_form_entry/new_online_registration_entity.dart';
import 'package:business_banking/features/new_online_registration_form/model/new_online_registration_form_entry/new_online_registration_enums.dart';
import 'package:business_banking/features/new_online_registration_form/model/new_online_registration_success/new_online_registration_success_view_model.dart';
import 'package:business_banking/locator.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework/clean_framework_defaults.dart';

class NewOnlineRegistrationRequestSuccessUseCase extends UseCase {
  RepositoryScope? __scopeRegistrationStatusResponse;
  final ViewModelCallback<ViewModel> _viewModelCallBack;

  NewOnlineRegistrationRequestSuccessUseCase(
      ViewModelCallback<ViewModel> viewModelCallBack)
      : _viewModelCallBack = viewModelCallBack;

  Future<void> create() async {
    __scopeRegistrationStatusResponse = ExampleLocator()
        .repository
        .create<NewOnlineRegistrationEntity>(
            NewOnlineRegistrationEntity(), _notifySubscribers);

    await ExampleLocator().repository.runServiceAdapter(
        __scopeRegistrationStatusResponse!,
        NewOnlineRegistrationRequestServiceAdapter());

    sendViewModelToSubscribers();
  }

//Use this when service is ready rather below one
  void sendViewModelToSubscribers() {
    NewOnlineRegistrationEntity newOnlineRegistrationEntity =
        ExampleLocator().repository.get(__scopeRegistrationStatusResponse!);
    _notifySubscribers(newOnlineRegistrationEntity);
  }

  // void sendViewModelToSubscribers() {
  //   NewOnlineRegistrationEntity newOnlineRegistrationEntity =
  //       ExampleLocator().repository.get(__scopeRegistrationStatusResponse!);
  //   final updatedEntity =
  //       newOnlineRegistrationEntity.merge(accountNumberGenerated: '12345');
  //   ExampleLocator().repository.update<NewOnlineRegistrationEntity>(
  //       __scopeRegistrationStatusResponse!,
  //       updatedEntity as NewOnlineRegistrationEntity);
  //   _notifySubscribers(updatedEntity);
  // }

  void _notifySubscribers(entity) {
    _viewModelCallBack(buildViewModel(entity));
  }

  NewOnlineRegistrationRequestSuccessViewModel buildViewModel(
      NewOnlineRegistrationEntity newOnlineRegistrationEntity) {
    if (newOnlineRegistrationEntity.errors.length > 0)
      return buildViewModelStatusError(newOnlineRegistrationEntity);
    else
      return buildViewModelStatusOK(newOnlineRegistrationEntity);
  }

  NewOnlineRegistrationRequestSuccessViewModel buildViewModelStatusOK(
      NewOnlineRegistrationEntity newOnlineRegistrationEntity) {
    return NewOnlineRegistrationRequestSuccessViewModel(
      cardHolderName: newOnlineRegistrationEntity.cardHolderName,
      accountNumberGenerated:
          newOnlineRegistrationEntity.accountNumberGenerated ?? '',
      serviceResponseStatus: NewOnlineRegistrationServiceResponseStatus.succeed,
    );
  }

  NewOnlineRegistrationRequestSuccessViewModel buildViewModelStatusError(
      NewOnlineRegistrationEntity newOnlineRegistrationEntity) {
    return NewOnlineRegistrationRequestSuccessViewModel(
      cardHolderName: newOnlineRegistrationEntity.cardHolderName,
      accountNumberGenerated:
          newOnlineRegistrationEntity.accountNumberGenerated,
      serviceResponseStatus: NewOnlineRegistrationServiceResponseStatus.failed,
    );
  }
}
