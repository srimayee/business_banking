import 'package:business_banking/features/new_online_registration_form/model/new_online_registration_form_entry/new_online_registration_view_model.dart';
import 'package:equatable/equatable.dart';

abstract class NewOnlineRegistrationEvent extends Equatable {}

class UpdateCardHolderNameRequestEvent extends NewOnlineRegistrationEvent {
  final String username;
  final NewOnlineRegistrationViewModel viewModel;

  UpdateCardHolderNameRequestEvent(this.viewModel, this.username);

  @override
  List<Object?> get props => [viewModel, username];
}

class UpdateCardHolderNumberRequestEvent extends NewOnlineRegistrationEvent {
  final String cardNumber;
  final NewOnlineRegistrationViewModel viewModel;

  UpdateCardHolderNumberRequestEvent(this.viewModel, this.cardNumber);

  @override
  List<Object?> get props => [viewModel, cardNumber];
}

class UpdateUserPasswordRequestEvent extends NewOnlineRegistrationEvent {
  final String password;
  final NewOnlineRegistrationViewModel viewModel;

  UpdateUserPasswordRequestEvent(this.viewModel, this.password);

  @override
  List<Object?> get props => [viewModel, password];
}

class UpdateEmailAddressRequestEvent extends NewOnlineRegistrationEvent {
  final String email;
  final NewOnlineRegistrationViewModel viewModel;

  UpdateEmailAddressRequestEvent(this.viewModel, this.email);

  @override
  List<Object?> get props => [viewModel, email];
}
