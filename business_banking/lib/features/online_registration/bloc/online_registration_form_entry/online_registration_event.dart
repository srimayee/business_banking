import 'package:equatable/equatable.dart';

abstract class OnlineRegistrationEvent extends Equatable {}

class UpdateCardHolderNameEvent implements OnlineRegistrationEvent {
  final String cardHolderName;

  UpdateCardHolderNameEvent(this.cardHolderName);

  @override
  List<Object> get props => [cardHolderName];

  @override
  bool get stringify => true;
}

class UpdateCardNumberEvent implements OnlineRegistrationEvent {
  final String cardNumber;

  UpdateCardNumberEvent(this.cardNumber);

  @override
  List<Object> get props => [cardNumber];

  @override
  bool get stringify => true;
}

class UpdateSSNLastFourDigitsEvent implements OnlineRegistrationEvent {
  final String ssnLastFourDigits;

  UpdateSSNLastFourDigitsEvent(this.ssnLastFourDigits);

  @override
  List<Object> get props => [ssnLastFourDigits];

  @override
  bool get stringify => true;
}

class UpdateUserEmailEvent implements OnlineRegistrationEvent {
  final String email;

  UpdateUserEmailEvent(this.email);

  @override
  List<Object> get props => [email];

  @override
  bool get stringify => true;
}

class UpdateUserPasswordEvent implements OnlineRegistrationEvent {
  final String userPassword;

  UpdateUserPasswordEvent(this.userPassword);

  @override
  List<Object> get props => [userPassword];

  @override
  bool get stringify => true;
}

class SubmitOnlineRegistrationEvent implements OnlineRegistrationEvent {
  SubmitOnlineRegistrationEvent();

  @override
  List<Object> get props => [];

  @override
  bool get stringify => true;
}
