import 'package:business_banking/features/online_registration/model/online_registration_form_entry/online_registration_entity.dart';
import 'package:business_banking/features/online_registration/model/online_registration_form_entry/online_registration_enums.dart';
import 'package:business_banking/features/online_registration/model/online_registration_form_entry/online_registration_view_model.dart';
import 'package:business_banking/locator.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework/clean_framework_defaults.dart';

class OnlineRegistrationUseCase extends UseCase {
  late final ViewModelCallback<OnlineRegistrationViewModel> _viewModelCallBack;
  RepositoryScope? _scope;

  OnlineRegistrationUseCase(
    ViewModelCallback<OnlineRegistrationViewModel> viewModelCallBack,
  ) : _viewModelCallBack = viewModelCallBack;

  void execute() {
    _scope =
        ExampleLocator().repository.containsScope<OnlineRegistrationEntity>();
    if (_scope == null) {
      _scope = ExampleLocator().repository.create<OnlineRegistrationEntity>(
          OnlineRegistrationEntity(), _notifySubscribers);
    } else {
      _scope!.subscription = _notifySubscribers;
    }
    final entity =
        ExampleLocator().repository.get<OnlineRegistrationEntity>(_scope!);
    _notifySubscribers(entity);
  }

  void _notifySubscribers(entity) {
    _viewModelCallBack(
        buildViewModelForServiceUpdate(entity, isResetAction: true));
  }

  void updateCardHolderName(String cardHolderName) {
    _scope ??= ExampleLocator().repository.create<OnlineRegistrationEntity>(
        new OnlineRegistrationEntity(), _notifySubscribers);

    final entity =
        ExampleLocator().repository.get<OnlineRegistrationEntity>(_scope!);
    if (cardHolderName.contains(RegExp(r"^[a-zA-Z ]*$")) == true) {
      final updatedEntity = entity.merge(cardHolderName: cardHolderName);
      ExampleLocator().repository.update<OnlineRegistrationEntity>(
          _scope!, updatedEntity as OnlineRegistrationEntity);
      _viewModelCallBack(buildViewModelForServiceUpdate(updatedEntity,
          status: '',
          inputStatusType: InputStatusType.cardHolderName,
          isUserInputValid: true));
    } else {
      final updatedEntity = entity.merge(cardHolderName: cardHolderName);
      ExampleLocator().repository.update<OnlineRegistrationEntity>(
          _scope!, updatedEntity as OnlineRegistrationEntity);
      _viewModelCallBack(buildViewModelForServiceUpdate(updatedEntity,
          status: 'Please, provide a valid name.',
          inputStatusType: InputStatusType.cardHolderName,
          isUserInputValid: false));
    }
  }

  void updateCreditCardNumber(String cardNumber) {
    _scope ??= ExampleLocator().repository.create<OnlineRegistrationEntity>(
        new OnlineRegistrationEntity(), _notifySubscribers);

    final entity =
        ExampleLocator().repository.get<OnlineRegistrationEntity>(_scope!);
    if (cardNumber.contains(RegExp(
            r"^(?:4[0-9]{12}(?:[0-9]{3})?|[25][1-7][0-9]{14}|6(?:011|5[0-9][0-9])[0-9]{12}|3[47][0-9]{13}|3(?:0[0-5]|[68][0-9])[0-9]{11}|(?:2131|1800|35\d{3})\d{11})$")) ==
        true) {
      final updatedEntity = entity.merge(cardNumber: cardNumber);
      ExampleLocator().repository.update<OnlineRegistrationEntity>(
          _scope!, updatedEntity as OnlineRegistrationEntity);
      _viewModelCallBack(buildViewModelForServiceUpdate(updatedEntity,
          status: '',
          inputStatusType: InputStatusType.cardNumber,
          isUserInputValid: true));
    } else {
      final updatedEntity = entity.merge(cardNumber: cardNumber);
      ExampleLocator().repository.update<OnlineRegistrationEntity>(
          _scope!, updatedEntity as OnlineRegistrationEntity);
      _viewModelCallBack(buildViewModelForServiceUpdate(updatedEntity,
          status: 'Enter valid credit card number.',
          inputStatusType: InputStatusType.cardNumber,
          isUserInputValid: false));
    }
  }

  void updateSsnLastFourDigits(String lastFourDigits) {
    _scope ??= ExampleLocator().repository.create<OnlineRegistrationEntity>(
        new OnlineRegistrationEntity(), _notifySubscribers);

    final entity =
        ExampleLocator().repository.get<OnlineRegistrationEntity>(_scope!);
    if (lastFourDigits.contains(RegExp(r'^[0-9]{4}$')) == true) {
      final updatedEntity = entity.merge(ssnLastFourDigits: lastFourDigits);
      ExampleLocator().repository.update<OnlineRegistrationEntity>(
          _scope!, updatedEntity as OnlineRegistrationEntity);
      _viewModelCallBack(buildViewModelForServiceUpdate(updatedEntity,
          status: '',
          inputStatusType: InputStatusType.ssnLastFourDigits,
          isUserInputValid: true));
    } else {
      final updatedEntity = entity.merge(ssnLastFourDigits: lastFourDigits);
      ExampleLocator().repository.update<OnlineRegistrationEntity>(
          _scope!, updatedEntity as OnlineRegistrationEntity);
      _viewModelCallBack(buildViewModelForServiceUpdate(updatedEntity,
          status: 'SSN Number is not valid.',
          inputStatusType: InputStatusType.ssnLastFourDigits,
          isUserInputValid: false));
    }
  }

  void updateEmail(String userEmail) {
    _scope ??= ExampleLocator().repository.create<OnlineRegistrationEntity>(
        new OnlineRegistrationEntity(), _notifySubscribers);

    final entity =
        ExampleLocator().repository.get<OnlineRegistrationEntity>(_scope!);
    if (userEmail.contains(RegExp(
            r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$")) ==
        true) {
      final updatedEntity = entity.merge(email: userEmail);
      ExampleLocator().repository.update<OnlineRegistrationEntity>(
          _scope!, updatedEntity as OnlineRegistrationEntity);
      _viewModelCallBack(buildViewModelForServiceUpdate(updatedEntity,
          status: '',
          inputStatusType: InputStatusType.email,
          isUserInputValid: true));
    } else {
      final updatedEntity = entity.merge(email: userEmail);
      ExampleLocator().repository.update<OnlineRegistrationEntity>(
          _scope!, updatedEntity as OnlineRegistrationEntity);
      _viewModelCallBack(buildViewModelForServiceUpdate(updatedEntity,
          status: 'Please, provide a valid email.',
          inputStatusType: InputStatusType.email,
          isUserInputValid: false));
    }
  }

  void updateUserPassword(String password) {
    _scope ??= ExampleLocator().repository.create<OnlineRegistrationEntity>(
        new OnlineRegistrationEntity(), _notifySubscribers);

    final entity =
        ExampleLocator().repository.get<OnlineRegistrationEntity>(_scope!);
    if (password.contains(
            RegExp(r"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d\w\W]{8,}$")) ==
        true) {
      final updatedEntity = entity.merge(userPassword: password);
      ExampleLocator().repository.update<OnlineRegistrationEntity>(
          _scope!, updatedEntity as OnlineRegistrationEntity);
      _viewModelCallBack(buildViewModelForServiceUpdate(updatedEntity,
          status: '',
          inputStatusType: InputStatusType.userPassword,
          isUserInputValid: true));
    } else {
      final updatedEntity = entity.merge(userPassword: password);
      ExampleLocator().repository.update<OnlineRegistrationEntity>(
          _scope!, updatedEntity as OnlineRegistrationEntity);
      _viewModelCallBack(buildViewModelForServiceUpdate(updatedEntity,
          status:
              'Password should be minimum eight characters, at least one uppercase letter, one lowercase letter and one number.',
          inputStatusType: InputStatusType.userPassword,
          isUserInputValid: false));
    }
  }

  void submitForm() {
    _scope ??= ExampleLocator().repository.create<OnlineRegistrationEntity>(
        new OnlineRegistrationEntity(), _notifySubscribers);

    final entity =
        ExampleLocator().repository.get<OnlineRegistrationEntity>(_scope!);
    print(
        'checkstatus : ${checkUserInputEntity(entity) == UserFormInputStatus.valid}');
    print('entity: ${entity.cardHolderName}');
    if (checkUserInputEntity(entity) == UserFormInputStatus.valid) {
      final updatedEntity = entity.merge(accountNumberGenerated: '12345');
      ExampleLocator().repository.update<OnlineRegistrationEntity>(
          _scope!, updatedEntity as OnlineRegistrationEntity);
      _viewModelCallBack(
          buildViewModelForServiceUpdate(entity, isUserInputValid: true));
      // ExampleLocator()
      //     .repository
      //     .runServiceAdapter(_scope!, OnlineRegistrationServiceAdapter());
    } else {
      _viewModelCallBack(
          buildViewModelForServiceUpdate(entity, isUserInputValid: true));
    }
  }

  OnlineRegistrationViewModel buildViewModelForServiceUpdate(
    OnlineRegistrationEntity entity, {
    String status = '',
    isUserInputValid = true,
    inputStatusType = InputStatusType.unknown,
    isResetAction = false,
  }) {
    if (entity.hasErrors()) {
      print('Has entity errors ');
      return OnlineRegistrationViewModel(
        cardHolderName: entity.cardHolderName,
        cardNumber: entity.cardNumber,
        ssnLastFourDigits: entity.ssnLastFourDigits,
        email: entity.email,
        userPassword: entity.userPassword,
        accountNumberGenerated: entity.accountNumberGenerated,
        cardHolderNameStatus:
            inputStatusType == InputStatusType.cardHolderName ? status : '',
        cardNumberStatus:
            inputStatusType == InputStatusType.cardNumber ? status : '',
        ssnLastFourDigitsStatus:
            inputStatusType == InputStatusType.ssnLastFourDigits ? status : '',
        userEmailStatus: inputStatusType == InputStatusType.email ? status : '',
        userPasswordStatus:
            inputStatusType == InputStatusType.userPassword ? status : '',
        userFormInputStatus: isUserInputValid
            ? checkUserInputEntity(entity)
            : UserFormInputStatus.invalid,
        serviceResponseStatus: ServiceResponseStatus.failed,
      );
    } else {
      return OnlineRegistrationViewModel(
          cardHolderName: entity.cardHolderName,
          cardNumber: entity.cardNumber,
          ssnLastFourDigits: entity.ssnLastFourDigits,
          email: entity.email,
          userPassword: entity.userPassword,
          accountNumberGenerated: entity.accountNumberGenerated,
          cardHolderNameStatus:
              inputStatusType == InputStatusType.cardHolderName ? status : '',
          cardNumberStatus:
              inputStatusType == InputStatusType.cardNumber ? status : '',
          ssnLastFourDigitsStatus:
              inputStatusType == InputStatusType.ssnLastFourDigits
                  ? status
                  : '',
          userEmailStatus:
              inputStatusType == InputStatusType.email ? status : '',
          userPasswordStatus:
              inputStatusType == InputStatusType.userPassword ? status : '',
          userFormInputStatus: isResetAction
              ? UserFormInputStatus.unknown
              : (isUserInputValid
                  ? checkUserInputEntity(entity)
                  : UserFormInputStatus.invalid),
          serviceResponseStatus: isResetAction
              ? ServiceResponseStatus.unknown
              : ServiceResponseStatus.succeed);
    }
  }

  UserFormInputStatus checkUserInputEntity(OnlineRegistrationEntity entity) {
    // print(
    //     "Name UserFormInputStatus ${entity.cardHolderName} ${entity.cardHolderName!.isNotEmpty}");
    // print(
    //     "Credit Card Number UserFormInputStatus ${entity.cardNumber} ${entity.cardNumber!.isNotEmpty}");
    // print(
    //     "SSN UserFormInputStatus ${entity.ssnLastFourDigits} ${entity.ssnLastFourDigits!.length == 4}");
    // print(
    //     "Email UserFormInputStatus ${entity.email} ${entity.email!.isNotEmpty}");
    print(
        "password UserFormInputStatus ${entity.userPassword} ${entity.userPassword!.length >= 8}");

    if (entity.cardHolderName!.isNotEmpty &&
        entity.cardNumber!.isNotEmpty &&
        entity.email!.isNotEmpty &&
        entity.ssnLastFourDigits!.isNotEmpty &&
        entity.userPassword!.length >= 8) {
      return UserFormInputStatus.valid;
    } else {
      return UserFormInputStatus.invalid;
    }
  }
}
