import 'package:business_banking/features/online_registration/model/online_registration_form_entry/online_registration_entity.dart';
import 'package:business_banking/features/online_registration/model/online_registration_form_entry/online_registration_enums.dart';
import 'package:business_banking/features/online_registration/model/online_registration_success/online_registration_success_view_model.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework/clean_framework_defaults.dart';

import '../../../../locator.dart';

class OnlineRegistrationSuccessUseCase extends UseCase {
  late final ViewModelCallback<OnlineRegistrationSuccessViewModel>
      _viewModelCallBack;
  RepositoryScope? _scope;

  OnlineRegistrationSuccessUseCase(
      ViewModelCallback<OnlineRegistrationSuccessViewModel> viewModelCallBack)
      : _viewModelCallBack = viewModelCallBack;

  void execute() async {
    _scope =
        ExampleLocator().repository.containsScope<OnlineRegistrationEntity>();

    if (_scope == null) {
      throw StateError('Online Registration entity does not exist');
    }
    _scope!.subscription = _notifySubscribers;
    final entity =
        ExampleLocator().repository.get<OnlineRegistrationEntity>(_scope!);
    _notifySubscribers(entity);
  }

  void _notifySubscribers(entity) {
    _viewModelCallBack(buildViewModel(entity));
  }

  void resetViewModel() {
    final entity =
        ExampleLocator().repository.get<OnlineRegistrationEntity>(_scope!);
    final emptyEntity = OnlineRegistrationEntity(
      cardHolderName: entity.cardHolderName,
      cardNumber: entity.cardNumber,
      ssnLastFourDigits: entity.ssnLastFourDigits,
      email: entity.email,
      userPassword: entity.userPassword,
    );
    ExampleLocator()
        .repository
        .update<OnlineRegistrationEntity>(_scope!, emptyEntity);
    _notifySubscribers(emptyEntity);
  }

  OnlineRegistrationSuccessViewModel buildViewModel(
      OnlineRegistrationEntity entity) {
    print(
        'OnlineRegistrationSuccessViewModel accountNumberGenerated: ${entity.accountNumberGenerated}');
    print(
        'OnlineRegistrationSuccessViewModel cardHolderName: ${entity.cardHolderName}');
    print(
        'OnlineRegistrationSuccessViewModel cardHolderName: ${entity.cardNumber}');
    print(
        'OnlineRegistrationSuccessViewModel cardHolderName: ${entity.userPassword}');
    print(
        'OnlineRegistrationSuccessViewModel cardHolderName: ${entity.ssnLastFourDigits}');
    print('OnlineRegistrationSuccessViewModel cardHolderName: ${entity.email}');
    print('entity.hasErrors(): ${entity.hasErrors()}');
    if (entity.hasErrors()) {
      return OnlineRegistrationSuccessViewModel(
          cardHolderName: entity.cardHolderName,
          cardNumber: entity.cardNumber,
          ssnLastFourDigits: entity.ssnLastFourDigits,
          email: entity.email,
          userPassword: entity.userPassword,
          accountNumberGenerated: entity.accountNumberGenerated ?? '',
          serviceResponseStatus: ServiceResponseStatus.failed);
    } else {
      if (entity.accountNumberGenerated!.isNotEmpty) {
        return OnlineRegistrationSuccessViewModel(
            cardHolderName: entity.cardHolderName,
            cardNumber: entity.cardNumber,
            ssnLastFourDigits: entity.ssnLastFourDigits,
            email: entity.email,
            userPassword: entity.userPassword,
            accountNumberGenerated: entity.accountNumberGenerated ?? '',
            serviceResponseStatus: ServiceResponseStatus.succeed);
      } else {
        return OnlineRegistrationSuccessViewModel(
            cardHolderName: entity.cardHolderName,
            cardNumber: entity.cardNumber,
            ssnLastFourDigits: entity.ssnLastFourDigits,
            email: entity.email,
            userPassword: entity.userPassword,
            accountNumberGenerated: entity.accountNumberGenerated ?? '',
            serviceResponseStatus: ServiceResponseStatus.failed);
      }
    }
  }
}
