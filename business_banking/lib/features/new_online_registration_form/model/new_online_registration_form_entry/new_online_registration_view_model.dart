import 'package:clean_framework/clean_framework.dart';

class NewOnlineRegistrationViewModel extends ViewModel {
  final String? cardHolderName;
  final String? cardNumber;
  final String? validThru;
  final String? email;
  final String? userPassword;
  final String? cardHolderNameStatus;
  final String? cardNumberStatus;
  final String? cardExpiryDateStatus;
  final String? userEmailStatus;
  final String? userPasswordStatus;

  NewOnlineRegistrationViewModel({
    required this.cardHolderName,
    required this.cardNumber,
    required this.validThru,
    required this.email,
    required this.userPassword,
    required this.cardHolderNameStatus,
    required this.cardNumberStatus,
    required this.cardExpiryDateStatus,
    required this.userEmailStatus,
    required this.userPasswordStatus,
  });

  @override
  List<Object?> get props => [
        cardHolderName,
        cardNumber,
        validThru,
        email,
        userPassword,
      ];
}
