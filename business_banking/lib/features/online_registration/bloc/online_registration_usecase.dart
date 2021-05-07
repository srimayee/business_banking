import 'package:business_banking/features/online_registration/bloc/online_registration_service_adapter.dart';
import 'package:business_banking/features/online_registration/model/online_registration_entity.dart';
import 'package:business_banking/features/online_registration/model/online_registration_view_model.dart';
import 'package:business_banking/locator.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework/clean_framework_defaults.dart';

class OnlineRegistrationUseCase extends UseCase {
  Function(ViewModel) _viewModelCallBack;
  RepositoryScope? _scope;

  OnlineRegistrationUseCase(Function(ViewModel) viewModelCallBack)
      : _viewModelCallBack = viewModelCallBack;

  void create() async {
    _scope =
        ExampleLocator().repository.containsScope<OnlineRegistrationEntity>();
    if (_scope == null) {
      final newOnlineRegistrationEntity = OnlineRegistrationEntity();
      _scope = ExampleLocator().repository.create<OnlineRegistrationEntity>(
          newOnlineRegistrationEntity, _notifySubscribers);
    } else {
      _scope!.subscription = _notifySubscribers;
    }
    final entity =
        ExampleLocator().repository.get<OnlineRegistrationEntity>(_scope!);
    _viewModelCallBack(buildViewModelForServiceUpdate(entity));
  }

  void submit() async {
    final entity =
        ExampleLocator().repository.get<OnlineRegistrationEntity>(_scope!);
    print("Name ${entity.cardHolderName}");
    print("Credit Card Number ${entity.cardNumber}");
    print("SSN ${entity.ssnLastFourDigits}");
    print("Email ${entity.email}");
    print("password ${entity.userPassword}");
    if (entity.userPassword == '' || entity.userPassword == '') {
      _viewModelCallBack(buildViewModelForLocalUpdateWithError(entity));
    } else {
      await ExampleLocator()
          .repository
          .runServiceAdapter(_scope!, OnlineRegistrationServiceAdapter());
    }
  }

  void updateCardHolderName(String cardHolderName) async {
    final entity =
        ExampleLocator().repository.get<OnlineRegistrationEntity>(_scope!);
    final updatedEntity = entity.merge(cardHolderName: cardHolderName);
    ExampleLocator().repository.update<OnlineRegistrationEntity>(
        _scope!, updatedEntity as OnlineRegistrationEntity);
    _viewModelCallBack(buildViewModelForLocalUpdate(updatedEntity));
  }

  void updateCardNumber(String cardNumber) async {
    final entity =
        ExampleLocator().repository.get<OnlineRegistrationEntity>(_scope!);
    final updatedEntity = entity.merge(cardHolderName: cardNumber);
    ExampleLocator().repository.update<OnlineRegistrationEntity>(
        _scope!, updatedEntity as OnlineRegistrationEntity);
    _viewModelCallBack(buildViewModelForLocalUpdate(updatedEntity));
  }

  void updateSsnLastFourDigits(String ssnLastFourDigits) async {
    final entity =
        ExampleLocator().repository.get<OnlineRegistrationEntity>(_scope!);
    final updatedEntity = entity.merge(ssnLastFourDigits: ssnLastFourDigits);
    ExampleLocator().repository.update<OnlineRegistrationEntity>(
        _scope!, updatedEntity as OnlineRegistrationEntity);
    _viewModelCallBack(buildViewModelForLocalUpdate(updatedEntity));
  }

  void updateEmail(String email) async {
    final entity =
        ExampleLocator().repository.get<OnlineRegistrationEntity>(_scope!);
    final updatedEntity = entity.merge(email: email);
    ExampleLocator().repository.update<OnlineRegistrationEntity>(
        _scope!, updatedEntity as OnlineRegistrationEntity);
    _viewModelCallBack(buildViewModelForLocalUpdate(updatedEntity));
  }

  void updateUserPassword(String userPassword) async {
    final entity =
        ExampleLocator().repository.get<OnlineRegistrationEntity>(_scope!);

    final updatedEntity = entity.merge(userPassword: userPassword);
    ExampleLocator().repository.update<OnlineRegistrationEntity>(
        _scope!, updatedEntity as OnlineRegistrationEntity);
    print("password ${entity.userPassword}");
    print("password2 ${updatedEntity.userPassword}");
    _viewModelCallBack(buildViewModelForLocalUpdate(updatedEntity));
  }

  void _notifySubscribers(entity) {
    _viewModelCallBack(buildViewModelForServiceUpdate(entity));
  }

  OnlineRegistrationViewModel buildViewModelForServiceUpdate(
      OnlineRegistrationEntity entity) {
    if (entity.hasErrors()) {
      return OnlineRegistrationViewModel(
        cardHolderName: entity.cardHolderName,
        cardNumber: entity.cardNumber,
        ssnLastFourDigits: entity.ssnLastFourDigits,
        email: entity.email,
        userPassword: entity.userPassword,
        // serviceStatus: ServiceStatus.fail
      );
    } else {
      return OnlineRegistrationViewModel(
        cardHolderName: entity.cardHolderName,
        cardNumber: entity.cardNumber,
        ssnLastFourDigits: entity.ssnLastFourDigits,
        email: entity.email,
        userPassword: entity.userPassword,
        // serviceStatus: ServiceStatus.success,
      );
    }
  }

  OnlineRegistrationViewModel buildViewModelForLocalUpdate(
      OnlineRegistrationEntity entity) {
    return OnlineRegistrationViewModel(
      cardHolderName: entity.cardHolderName,
      cardNumber: entity.cardNumber,
      ssnLastFourDigits: entity.ssnLastFourDigits,
      email: entity.email,
      userPassword: entity.userPassword,
    );
  }

  OnlineRegistrationViewModel buildViewModelForLocalUpdateWithError(
      OnlineRegistrationEntity entity) {
    return OnlineRegistrationViewModel(
      cardHolderName: entity.cardHolderName,
      cardNumber: entity.cardNumber,
      ssnLastFourDigits: entity.ssnLastFourDigits,
      email: entity.email,
      userPassword: entity.userPassword,
      // dataStatus: DataStatus.invalid,
    );
  }
}
