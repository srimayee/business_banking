import 'package:equatable/equatable.dart';

abstract class NewOnlineRegistrationRequestSuccessEvent extends Equatable {}

class NewResetOnlineRegistrationViewModelEvent
    implements NewOnlineRegistrationRequestSuccessEvent {
  NewResetOnlineRegistrationViewModelEvent();

  @override
  List<Object> get props => [];

  @override
  bool get stringify => true;
}

// class ResetServiceStatusEvent implements NewOnlineRegistrationRequestSuccessEvent {
//   ResetServiceStatusEvent();
//
//   @override
//   List<Object> get props => [];
//
//   @override
//   bool get stringify => true;
// }
