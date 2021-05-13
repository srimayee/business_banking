import 'package:equatable/equatable.dart';

abstract class NewOnlineRegistrationEvent extends Equatable {}

class UpdateCardHolderNameRequestEvent extends NewOnlineRegistrationEvent {
  final String username;

  UpdateCardHolderNameRequestEvent(this.username);

  @override
  List<Object?> get props => [username];
  @override
  bool get stringify => true;
}

class UpdateCardHolderNumberRequestEvent extends NewOnlineRegistrationEvent {
  final String cardNumber;

  UpdateCardHolderNumberRequestEvent(this.cardNumber);

  @override
  List<Object?> get props => [cardNumber];
  @override
  bool get stringify => true;
}

class UpdateUserPasswordRequestEvent extends NewOnlineRegistrationEvent {
  final String password;

  UpdateUserPasswordRequestEvent(this.password);

  @override
  List<Object?> get props => [password];
  @override
  bool get stringify => true;
}

class UpdateEmailAddressRequestEvent extends NewOnlineRegistrationEvent {
  final String email;

  UpdateEmailAddressRequestEvent(this.email);

  @override
  List<Object?> get props => [email];
  @override
  bool get stringify => true;
}
