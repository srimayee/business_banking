import 'package:clean_framework/clean_framework.dart';

class OnlineRegistrationSuccessViewModel extends ViewModel {
  final String? cardHolderName;
  final String? cardNumber;
  final String? ssnLastFourDigits;
  final String? email;
  final String? userPassword;
  final String? accountNumberGenerated;
  final serviceResponseStatus;

  OnlineRegistrationSuccessViewModel(
      {required this.cardHolderName,
      required this.cardNumber,
      required this.ssnLastFourDigits,
      required this.email,
      required this.userPassword,
      required this.accountNumberGenerated,
      required this.serviceResponseStatus});

  @override
  List<Object> get props => [
        cardHolderName!,
        cardNumber!,
        ssnLastFourDigits!,
        email!,
        userPassword!,
        accountNumberGenerated!,
      ];
}
