import 'package:business_banking/features/new_online_registration_form/model/new_online_registration_form_entry/new_online_registration_enums.dart';
import 'package:clean_framework/clean_framework.dart';

class NewOnlineRegistrationViewModel extends ViewModel {
  final String? cardHolderName;
  final String? cardNumber;
  final String? userPassword;
  final String? email;
  final serviceResponseStatus;

  NewOnlineRegistrationViewModel(
      {required this.cardHolderName,
      required this.cardNumber,
      // required this.ssnLastFourDigits,
      required this.email,
      required this.userPassword,
      // required this.accountNumberGenerated,
      // required this.cardNumberStatus,
      // required this.cardHolderNameStatus,
      // required this.ssnLastFourDigitsStatus,
      // required this.userEmailStatus,
      // required this.userPasswordStatus,
      // this.userFormInputStatus = UserFormInputStatus.unknown,
      this.serviceResponseStatus =
          NewOnlineRegistrationServiceResponseStatus.unknown});

  @override
  List<Object?> get props => [
        cardHolderName,
        cardNumber,
        // ssnLastFourDigits,
        email,
        userPassword,
        // accountNumberGenerated
      ];
}
