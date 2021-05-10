import 'package:equatable/equatable.dart';

abstract class OnlineRegistrationSuccessEvent extends Equatable {}

class ResetOnlineRegistrationViewModelEvent
    implements OnlineRegistrationSuccessEvent {
  ResetOnlineRegistrationViewModelEvent();

  @override
  List<Object> get props => [];

  @override
  bool get stringify => true;
}

class ResetServiceStatusEvent implements OnlineRegistrationSuccessEvent {
  ResetServiceStatusEvent();

  @override
  List<Object> get props => [];

  @override
  bool get stringify => true;
}
