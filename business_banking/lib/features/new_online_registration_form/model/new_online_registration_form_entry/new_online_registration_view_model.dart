import 'package:business_banking/features/new_online_registration_form/model/new_online_registration_form_entry/new_online_registration_enums.dart';
import 'package:clean_framework/clean_framework.dart';

class NewOnlineRegistrationViewModel extends ViewModel {
  final String? cardHolderName;
  final String? cardNumber;
  final String? userPassword;
  final String? email;
  final String? cardHolderNameStatus;
  final String? cardNumberStatus;
  final String? userEmailStatus;
  final String? userPasswordStatus;
  final serviceResponseStatus;

  NewOnlineRegistrationViewModel(
      {required this.cardHolderName,
      required this.cardNumber,
      required this.email,
      required this.userPassword,
      required this.cardHolderNameStatus,
      required this.cardNumberStatus,
      required this.userEmailStatus,
      required this.userPasswordStatus,
      this.serviceResponseStatus =
          NewOnlineRegistrationServiceResponseStatus.unknown});

  @override
  List<Object?> get props => [
        cardHolderName,
        cardNumber,
        email,
        userPassword,
      ];
}
