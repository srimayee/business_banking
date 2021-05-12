import 'package:clean_framework/clean_framework.dart';

class NewOnlineRegistrationEntity extends Entity {
  final String? cardNumber;
  final String? cardHolderName;
  // final String? ssnLastFourDigits;
  final String? email;
  final String? userPassword;
  final String? accountNumberGenerated;

  NewOnlineRegistrationEntity({
    List<EntityFailure> errors = const [],
    String? cardHolderName,
    String? cardNumber,
    String? email,
    String? userPassword,
    String? accountNumberGenerated,
  })  : cardHolderName = cardHolderName ?? '',
        cardNumber = cardNumber ?? '',
        email = email ?? '',
        userPassword = userPassword ?? '',
        accountNumberGenerated = accountNumberGenerated ?? '',
        super(errors: errors);

  @override
  List<Object> get props => [
        errors,
        cardHolderName!,
        cardNumber!,
        email!,
        userPassword!,
        accountNumberGenerated!,
      ];

  @override
  merge({
    errors,
    String? cardHolderName,
    String? cardNumber,
    String? email,
    String? userPassword,
    String? accountNumberGenerated,
  }) {
    return NewOnlineRegistrationEntity(
      errors: errors ?? this.errors,
      cardHolderName: cardHolderName ?? this.cardHolderName,
      cardNumber: cardNumber ?? this.cardNumber,
      email: email ?? this.email,
      userPassword: userPassword ?? this.userPassword,
      accountNumberGenerated:
          accountNumberGenerated ?? this.accountNumberGenerated,
    );
  }
}
