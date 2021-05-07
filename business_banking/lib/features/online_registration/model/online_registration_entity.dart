import 'package:clean_framework/clean_framework.dart';

class OnlineRegistrationEntity extends Entity {
  final String? cardNumber;
  final String? cardHolderName;
  final String? ssnLastFourDigits;
  final String? email;
  final String? userPassword;

  OnlineRegistrationEntity({
    List<EntityFailure> errors = const [],
    String? cardNumber,
    String? cardHolderName,
    String? ssnLastFourDigits,
    String? email,
    String? userPassword,
  })  : cardNumber = cardNumber ?? '',
        cardHolderName = cardHolderName ?? '',
        ssnLastFourDigits = ssnLastFourDigits ?? '',
        email = email ?? '',
        userPassword = userPassword ?? '',
        super(errors: errors);

  @override
  List<Object> get props => [
        errors,
        cardNumber!,
        cardHolderName!,
        ssnLastFourDigits!,
        email!,
        userPassword!,
      ];

  @override
  merge({
    errors,
    String? cardNumber,
    String? cardHolderName,
    String? ssnLastFourDigits,
    String? email,
    String? userPassword,
  }) {
    return OnlineRegistrationEntity(
      errors: errors ?? this.errors,
      cardNumber: cardNumber ?? this.cardNumber,
      cardHolderName: cardHolderName ?? this.cardHolderName,
      ssnLastFourDigits: ssnLastFourDigits ?? this.ssnLastFourDigits,
      email: email ?? this.email,
      userPassword: userPassword ?? this.userPassword,
    );
  }
}
