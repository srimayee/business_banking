import 'package:clean_framework/clean_framework.dart';

class NewOnlineRegistrationRequestSuccessViewModel extends ViewModel {
  final String? cardHolderName;
  final String? cardNumber;
  final String? email;
  final String? userPassword;
  final String? accountNumberGenerated;
  final serviceResponseStatus;

  NewOnlineRegistrationRequestSuccessViewModel(
      {required this.cardHolderName,
      required this.cardNumber,
      required this.email,
      required this.userPassword,
      required this.accountNumberGenerated,
      required this.serviceResponseStatus});

  @override
  List<Object> get props => [
        cardHolderName!,
        cardNumber!,
        email!,
        userPassword!,
        accountNumberGenerated!,
      ];
}
