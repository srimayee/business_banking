import 'package:clean_framework/clean_framework.dart';

class OnlineRegistrationEntity extends Entity {
  final String? cardNumber;
  final String? cardHolderName;
  final String? ssnLastFourDigits;
  final String? email;
  final String? userPassword;
  final String? accountNumberGenerated;

  OnlineRegistrationEntity({
    List<EntityFailure> errors = const [],
    String? cardHolderName,
    String? cardNumber,
    String? ssnLastFourDigits,
    String? email,
    String? userPassword,
    String? accountNumberGenerated,
  })  : cardHolderName = cardHolderName ?? '',
        cardNumber = cardNumber ?? '',
        ssnLastFourDigits = ssnLastFourDigits ?? '',
        email = email ?? '',
        userPassword = userPassword ?? '',
        accountNumberGenerated = accountNumberGenerated ?? '',
        super(errors: errors);

  @override
  List<Object> get props => [
        errors,
        cardHolderName!,
        cardNumber!,
        ssnLastFourDigits!,
        email!,
        userPassword!,
        accountNumberGenerated!,
      ];

  @override
  merge({
    errors,
    String? cardHolderName,
    String? cardNumber,
    String? ssnLastFourDigits,
    String? email,
    String? userPassword,
    String? accountNumberGenerated,
  }) {
    return OnlineRegistrationEntity(
      errors: errors ?? this.errors,
      cardHolderName: cardHolderName ?? this.cardHolderName,
      cardNumber: cardNumber ?? this.cardNumber,
      ssnLastFourDigits: ssnLastFourDigits ?? this.ssnLastFourDigits,
      email: email ?? this.email,
      userPassword: userPassword ?? this.userPassword,
      accountNumberGenerated:
          accountNumberGenerated ?? this.accountNumberGenerated,
    );
  }
}
