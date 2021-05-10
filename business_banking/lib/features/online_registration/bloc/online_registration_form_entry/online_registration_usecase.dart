import 'package:business_banking/features/online_registration/model/online_registration_form_entry/online_registration_entity.dart';
import 'package:business_banking/features/online_registration/model/online_registration_form_entry/online_registration_enums.dart';
import 'package:business_banking/features/online_registration/model/online_registration_form_entry/online_registration_view_model.dart';
import 'package:business_banking/locator.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework/clean_framework_defaults.dart';

class OnlineRegistrationUseCase extends UseCase {
  ViewModelCallback<OnlineRegistrationViewModel> _viewModelCallBack;
  RepositoryScope? _scope;

  OnlineRegistrationUseCase(
    ViewModelCallback<OnlineRegistrationViewModel> viewModelCallBack,
  ) : _viewModelCallBack = viewModelCallBack;

  void execute() async {
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

  void _notifySubscribers(entity,
      {bool isResetAction = true, bool isUserInputValid = true}) {
    _viewModelCallBack(buildViewModelForServiceUpdate(entity,
        isResetAction: isResetAction, isUserInputValid: isUserInputValid));
  }

  OnlineRegistrationEntity getEntity() {
    _scope ??= ExampleLocator().repository.create<OnlineRegistrationEntity>(
        new OnlineRegistrationEntity(), _notifySubscribers);

    return ExampleLocator().repository.get<OnlineRegistrationEntity>(_scope!);
  }

  void updateRepository(updatedEntity) {
    ExampleLocator().repository.update<OnlineRegistrationEntity>(
        _scope!, updatedEntity as OnlineRegistrationEntity);
  }

  void updateCardHolderName(String cardHolderName) {
    final updatedEntity = getEntity().merge(cardHolderName: cardHolderName);
    updateRepository(updatedEntity);
    if (cardHolderName.contains(RegExp(r"^[a-zA-Z ]*$")) == true) {
      _viewModelCallBack(buildViewModelForServiceUpdate(
          updatedEntity as OnlineRegistrationEntity,
          status: '',
          inputStatusType: InputStatusType.cardHolderName,
          isUserInputValid: true));
    } else {
      _viewModelCallBack(buildViewModelForServiceUpdate(
          updatedEntity as OnlineRegistrationEntity,
          status: 'Please, provide a valid name.',
          inputStatusType: InputStatusType.cardHolderName,
          isUserInputValid: false));
    }
  }

  void updateCreditCardNumber(String cardNumber) {
    final updatedEntity = getEntity().merge(cardNumber: cardNumber);
    updateRepository(updatedEntity);
    if (cardNumber.contains(RegExp(
            r"^(?:4[0-9]{12}(?:[0-9]{3})?|[25][1-7][0-9]{14}|6(?:011|5[0-9][0-9])[0-9]{12}|3[47][0-9]{13}|3(?:0[0-5]|[68][0-9])[0-9]{11}|(?:2131|1800|35\d{3})\d{11})$")) ==
        true) {
      _viewModelCallBack(buildViewModelForServiceUpdate(
          updatedEntity as OnlineRegistrationEntity,
          status: '',
          inputStatusType: InputStatusType.cardNumber,
          isUserInputValid: true));
    } else {
      _viewModelCallBack(buildViewModelForServiceUpdate(
          updatedEntity as OnlineRegistrationEntity,
          status: 'Enter valid credit card number.',
          inputStatusType: InputStatusType.cardNumber,
          isUserInputValid: false));
    }
  }

  void updateSsnLastFourDigits(String lastFourDigits) {
    final updatedEntity = getEntity().merge(ssnLastFourDigits: lastFourDigits);
    updateRepository(updatedEntity);
    if (lastFourDigits.contains(RegExp(r'^[0-9]{4}$')) == true) {
      _viewModelCallBack(buildViewModelForServiceUpdate(
          updatedEntity as OnlineRegistrationEntity,
          status: '',
          inputStatusType: InputStatusType.ssnLastFourDigits,
          isUserInputValid: true));
    } else {
      _viewModelCallBack(buildViewModelForServiceUpdate(
          updatedEntity as OnlineRegistrationEntity,
          status: 'SSN Number is not valid.',
          inputStatusType: InputStatusType.ssnLastFourDigits,
          isUserInputValid: false));
    }
  }

  void updateEmail(String userEmail) {
    final updatedEntity = getEntity().merge(email: userEmail);
    updateRepository(updatedEntity);
    if (userEmail.contains(RegExp(
            r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$")) ==
        true) {
      _viewModelCallBack(buildViewModelForServiceUpdate(
          updatedEntity as OnlineRegistrationEntity,
          status: '',
          inputStatusType: InputStatusType.email,
          isUserInputValid: true));
    } else {
      _viewModelCallBack(buildViewModelForServiceUpdate(
          updatedEntity as OnlineRegistrationEntity,
          status: 'Please, provide a valid email.',
          inputStatusType: InputStatusType.email,
          isUserInputValid: false));
    }
  }

  void updateUserPassword(String password) {
    final updatedEntity = getEntity().merge(userPassword: password);
    updateRepository(updatedEntity);
    if (password.contains(
            RegExp(r"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d\w\W]{8,}$")) ==
        true) {
      _viewModelCallBack(buildViewModelForServiceUpdate(
          updatedEntity as OnlineRegistrationEntity,
          status: '',
          inputStatusType: InputStatusType.userPassword,
          isUserInputValid: true));
    } else {
      _viewModelCallBack(buildViewModelForServiceUpdate(
          updatedEntity as OnlineRegistrationEntity,
          status:
              'Password should be minimum eight characters, at least one uppercase letter, one lowercase letter and one number.',
          inputStatusType: InputStatusType.userPassword,
          isUserInputValid: false));
    }
  }

  void submitForm() {
    print(
        'check status : ${checkUserInputEntity(getEntity()) == UserFormInputStatus.valid}');
    print('entity: ${getEntity().cardHolderName}');
    if (checkUserInputEntity(getEntity()) == UserFormInputStatus.valid) {
      final updatedEntity = getEntity().merge(accountNumberGenerated: '12345');
      updateRepository(updatedEntity);
      _notifySubscribers(getEntity(),
          isUserInputValid: true, isResetAction: false);
      // ExampleLocator()
      //     .repository
      //     .runServiceAdapter(_scope!, OnlineRegistrationServiceAdapter());
    } else {
      _notifySubscribers(getEntity(),
          isUserInputValid: true, isResetAction: false);
    }
  }

  UserFormInputStatus checkUserInputEntity(OnlineRegistrationEntity entity) {
    print(
        "Name UserFormInputStatus ${entity.cardHolderName} ${entity.cardHolderName!.isNotEmpty}");
    print(
        "Credit Card Number UserFormInputStatus ${entity.cardNumber} ${entity.cardNumber!.isNotEmpty}");
    print(
        "SSN UserFormInputStatus ${entity.ssnLastFourDigits} ${entity.ssnLastFourDigits!.length == 4}");
    print(
        "Email UserFormInputStatus ${entity.email} ${entity.email!.isNotEmpty}");
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
}
