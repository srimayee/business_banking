import 'package:business_banking/features/online_registration/model/online_registration_form_entry/online_registration_enums.dart';
import 'package:clean_framework/clean_framework.dart';

class OnlineRegistrationViewModel extends ViewModel {
  final String? cardHolderName;
  final String? cardNumber;
  final String? ssnLastFourDigits;
  final String? email;
  final String? userPassword;
  final String? accountNumberGenerated;
  final String? cardNumberStatus;
  final String? cardHolderNameStatus;
  final String? ssnLastFourDigitsStatus;
  final String? userEmailStatus;
  final String? userPasswordStatus;
  final userFormInputStatus;
  final serviceResponseStatus;

  OnlineRegistrationViewModel(
      {required this.cardHolderName,
      required this.cardNumber,
      required this.ssnLastFourDigits,
      required this.email,
      required this.userPassword,
      required this.accountNumberGenerated,
      required this.cardNumberStatus,
      required this.cardHolderNameStatus,
      required this.ssnLastFourDigitsStatus,
      required this.userEmailStatus,
      required this.userPasswordStatus,
      this.userFormInputStatus = UserFormInputStatus.unknown,
      this.serviceResponseStatus = ServiceResponseStatus.unknown});

  @override
  List<Object?> get props => [
        cardHolderName,
        cardNumber,
        ssnLastFourDigits,
        email,
        userPassword,
        accountNumberGenerated
      ];
}
