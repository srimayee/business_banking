import 'package:business_banking/features/new_online_registration_form/model/new_online_registration_form_entry/new_online_registration_entity.dart';
import 'package:business_banking/features/new_online_registration_form/model/new_online_registration_form_entry/new_online_registration_enums.dart';
import 'package:business_banking/features/new_online_registration_form/model/new_online_registration_form_entry/new_online_registration_view_model.dart';
import 'package:business_banking/locator.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework/clean_framework_defaults.dart';

class NewOnlineRegistrationRequestUseCase extends UseCase {
  RepositoryScope? _scopeRegistrationFormEntity;
  final ViewModelCallback<ViewModel> _viewModelCallBack;
  NewOnlineRegistrationRequestUseCase(
      ViewModelCallback<ViewModel> viewModelCallBack)
      : _viewModelCallBack = viewModelCallBack;

  Future<void> create() async {
    _scopeRegistrationFormEntity = ExampleLocator()
        .repository
        .create<NewOnlineRegistrationEntity>(
            NewOnlineRegistrationEntity(), _notifySubscribers);
    NewOnlineRegistrationEntity newOnlineRegistrationEntity =
        ExampleLocator().repository.get(_scopeRegistrationFormEntity!);

    _notifySubscribers(newOnlineRegistrationEntity);
  }

  void _notifySubscribers(entity) {
    _viewModelCallBack(buildViewModel());
  }

  NewOnlineRegistrationViewModel buildViewModel({
    status: '',
    inputStatusType = NewOnlineRegistrationInputStatusType.unknown,
    NewOnlineRegistrationEntity? newOnlineRegistrationEntity,
  }) {
    newOnlineRegistrationEntity = newOnlineRegistrationEntity ??
        ExampleLocator().repository.get(_scopeRegistrationFormEntity!);
    if (newOnlineRegistrationEntity.hasErrors()) {
      return NewOnlineRegistrationViewModel(
        cardHolderName: newOnlineRegistrationEntity.cardHolderName,
        cardNumber: newOnlineRegistrationEntity.cardNumber,
        email: newOnlineRegistrationEntity.email,
        userPassword: newOnlineRegistrationEntity.userPassword,
        cardHolderNameStatus: inputStatusType ==
                NewOnlineRegistrationInputStatusType.cardHolderName
            ? status
            : '',
        cardNumberStatus:
            inputStatusType == NewOnlineRegistrationInputStatusType.cardNumber
                ? status
                : '',
        userEmailStatus:
            inputStatusType == NewOnlineRegistrationInputStatusType.email
                ? status
                : '',
        userPasswordStatus:
            inputStatusType == NewOnlineRegistrationInputStatusType.userPassword
                ? status
                : '',
        serviceResponseStatus:
            NewOnlineRegistrationServiceResponseStatus.failed,
      );
    } else {
      return NewOnlineRegistrationViewModel(
        cardHolderName: newOnlineRegistrationEntity.cardHolderName,
        cardNumber: newOnlineRegistrationEntity.cardNumber,
        email: newOnlineRegistrationEntity.email,
        userPassword: newOnlineRegistrationEntity.userPassword,
        cardHolderNameStatus: inputStatusType ==
                NewOnlineRegistrationInputStatusType.cardHolderName
            ? status
            : '',
        cardNumberStatus:
            inputStatusType == NewOnlineRegistrationInputStatusType.cardNumber
                ? status
                : '',
        userEmailStatus:
            inputStatusType == NewOnlineRegistrationInputStatusType.email
                ? status
                : '',
        userPasswordStatus:
            inputStatusType == NewOnlineRegistrationInputStatusType.userPassword
                ? status
                : '',
        serviceResponseStatus:
            NewOnlineRegistrationServiceResponseStatus.succeed,
      );
    }
  }

  updateUserName(String userName) {
    final NewOnlineRegistrationEntity entity = ExampleLocator()
        .repository
        .get<NewOnlineRegistrationEntity>(_scopeRegistrationFormEntity!);
    final updatedEntity = entity.merge(cardHolderName: userName);
    ExampleLocator().repository.update<NewOnlineRegistrationEntity>(
        _scopeRegistrationFormEntity!,
        updatedEntity as NewOnlineRegistrationEntity);
    String? checkUserInputStatus = validateUserName(userName);
    if (checkUserInputStatus.isNotEmpty) {
      _viewModelCallBack(buildViewModel(
        status: checkUserInputStatus,
        inputStatusType: NewOnlineRegistrationInputStatusType.cardHolderName,
      ));
    } else {
      _viewModelCallBack(buildViewModel());
    }
  }

  updateCardNumber(String cardNumber) {
    final NewOnlineRegistrationEntity entity = ExampleLocator()
        .repository
        .get<NewOnlineRegistrationEntity>(_scopeRegistrationFormEntity!);
    final updatedEntity = entity.merge(cardNumber: cardNumber);
    ExampleLocator().repository.update<NewOnlineRegistrationEntity>(
        _scopeRegistrationFormEntity!,
        updatedEntity as NewOnlineRegistrationEntity);
    String? checkUserInputStatus = validateCardNumber(cardNumber);
    if (checkUserInputStatus.isNotEmpty) {
      _viewModelCallBack(buildViewModel(
        status: checkUserInputStatus,
        inputStatusType: NewOnlineRegistrationInputStatusType.cardNumber,
      ));
    } else {
      _viewModelCallBack(buildViewModel());
    }
  }

  updateEmailAddress(String _email) {
    final NewOnlineRegistrationEntity entity = ExampleLocator()
        .repository
        .get<NewOnlineRegistrationEntity>(_scopeRegistrationFormEntity!);
    final updatedEntity = entity.merge(email: _email);
    ExampleLocator().repository.update<NewOnlineRegistrationEntity>(
        _scopeRegistrationFormEntity!,
        updatedEntity as NewOnlineRegistrationEntity);
    String checkUserInputStatus = validateEmailAddress(_email);
    if (checkUserInputStatus.isNotEmpty) {
      _viewModelCallBack(buildViewModel(
        status: checkUserInputStatus,
        inputStatusType: NewOnlineRegistrationInputStatusType.email,
      ));
    } else {
      _viewModelCallBack(buildViewModel());
    }
  }

  updatePassword(String password) {
    final NewOnlineRegistrationEntity entity = ExampleLocator()
        .repository
        .get<NewOnlineRegistrationEntity>(_scopeRegistrationFormEntity!);
    final updatedEntity = entity.merge(userPassword: password);
    ExampleLocator().repository.update<NewOnlineRegistrationEntity>(
        _scopeRegistrationFormEntity!,
        updatedEntity as NewOnlineRegistrationEntity);
    String checkUserInputStatus = validateUserPassword(password);
    if (checkUserInputStatus.isNotEmpty) {
      _viewModelCallBack(buildViewModel(
        status: checkUserInputStatus,
        inputStatusType: NewOnlineRegistrationInputStatusType.userPassword,
      ));
    } else {
      _viewModelCallBack(buildViewModel());
    }
  }

  String validateUserName(String userName) {
    if (userName.isNotEmpty &&
        userName.contains(RegExp(r"^[a-zA-Z]*$")) == true) {
      return '';
    } else {
      return "Please provide valid name.";
    }
  }

  String validateCardNumber(String cardNumber) {
    if (cardNumber.isNotEmpty &&
        cardNumber.contains(RegExp(
                r"^(?:4[0-9]{12}(?:[0-9]{3})?|[25][1-7][0-9]{14}|6(?:011|5[0-9][0-9])[0-9]{12}|3[47][0-9]{13}|3(?:0[0-5]|[68][0-9])[0-9]{11}|(?:2131|1800|35\d{3})\d{11})$")) ==
            true) {
      return '';
    } else {
      return "Please provide valid credit card Number.";
    }
  }

  String validateEmailAddress(String userEmail) {
    if (userEmail.isNotEmpty &&
        userEmail.contains(RegExp(
                r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$")) ==
            true) {
      return '';
    } else {
      return "Please, provide a valid email.";
    }
  }

  String validateUserPassword(String password) {
    if (password.isNotEmpty &&
        password.contains(RegExp(
                r"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d\w\W]{8,}$")) ==
            true) {
      return '';
    } else {
      return "Password should be minimum eight characters, at least one uppercase letter, one lowercase letter and one number.";
    }
  }
}
