import 'package:clean_framework/clean_framework.dart';

class OnlineRegistrationViewModel extends ViewModel {
  final String? cardNumber;
  final String? cardHolderName;
  final String? ssnLastFourDigits;
  final String? email;
  final String? userPassword;

  OnlineRegistrationViewModel({
    required this.cardNumber,
    required this.cardHolderName,
    required this.ssnLastFourDigits,
    required this.email,
    required this.userPassword,
  });

  @override
  List<Object?> get props =>
      [cardNumber, cardHolderName, ssnLastFourDigits, email, userPassword];
}
