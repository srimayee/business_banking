import 'package:business_banking/features/new_online_registration_form/bloc/new_online_registration_form_entry/new_online_registration_event.dart';
import 'package:business_banking/features/new_online_registration_form/bloc/new_online_registration_form_entry/new_online_registration_usecase.dart';
import 'package:business_banking/features/new_online_registration_form/bloc/new_online_registration_success/new_online_registration_success_usecase.dart';
import 'package:business_banking/features/new_online_registration_form/model/new_online_registration_form_entry/new_online_registration_view_model.dart';
import 'package:business_banking/features/new_online_registration_form/model/new_online_registration_success/new_online_registration_success_view_model.dart';
import 'package:clean_framework/clean_framework.dart';

class NewOnlineRegistrationBloc extends Bloc {
  final newOnlineRegistrationEventsPipe =
      Pipe<NewOnlineRegistrationEvent>(canSendDuplicateData: true);

  NewOnlineRegistrationRequestUseCase? _newOnlineRegistrationRequestUseCase;
  final newOnlineRegistrationViewModelPipe =
      Pipe<NewOnlineRegistrationViewModel>();

  NewOnlineRegistrationRequestSuccessUseCase?
      _newOnlineRegistrationRequestSuccessUseCase;
  final newOnlineRegistrationSuccessViewModelPipe =
      Pipe<NewOnlineRegistrationRequestSuccessViewModel>();

  NewOnlineRegistrationBloc({
    NewOnlineRegistrationRequestUseCase? newOnlineRegistrationRequestUseCase,
    NewOnlineRegistrationRequestSuccessUseCase?
        newOnlineRegistrationRequestSuccessUseCase,
  }) {
    newOnlineRegistrationEventsPipe.receive.listen((event) {
      newOnlineRegistrationEventsPipeHandler(event);
    });
    _newOnlineRegistrationRequestUseCase =
        newOnlineRegistrationRequestUseCase ??
            NewOnlineRegistrationRequestUseCase((viewModel) =>
                newOnlineRegistrationViewModelPipe
                    .send(viewModel as NewOnlineRegistrationViewModel));
    newOnlineRegistrationViewModelPipe
        .whenListenedDo(_newOnlineRegistrationRequestUseCase!.create);

//success pipe and usecase
    _newOnlineRegistrationRequestSuccessUseCase =
        newOnlineRegistrationRequestSuccessUseCase ??
            NewOnlineRegistrationRequestSuccessUseCase((viewModel) =>
                newOnlineRegistrationSuccessViewModelPipe.send(
                    viewModel as NewOnlineRegistrationRequestSuccessViewModel));
    newOnlineRegistrationSuccessViewModelPipe
        .whenListenedDo(_newOnlineRegistrationRequestSuccessUseCase!.create);
  }

  @override
  void dispose() {
    newOnlineRegistrationEventsPipe.dispose();
    newOnlineRegistrationViewModelPipe.dispose();
    newOnlineRegistrationSuccessViewModelPipe.dispose();
  }

  newOnlineRegistrationEventsPipeHandler(NewOnlineRegistrationEvent event) {
    if (event is UpdateCardHolderNameRequestEvent) {
      _newOnlineRegistrationRequestUseCase!.updateUserName(event.username);
      return;
    } else if (event is UpdateCardHolderNumberRequestEvent) {
      _newOnlineRegistrationRequestUseCase!.updateCardNumber(event.cardNumber);
      return;
    } else if (event is UpdateUserPasswordRequestEvent) {
      _newOnlineRegistrationRequestUseCase!.updatePassword(event.password);
      return;
    } else if (event is UpdateEmailAddressRequestEvent) {
      _newOnlineRegistrationRequestUseCase!.updateEmailAddress(event.email);
      return;
    }
  }

  String validateUserName(
      NewOnlineRegistrationViewModel newOnlineRegistrationViewModel,
      String userName) {
    return _newOnlineRegistrationRequestUseCase!.validateUserName(userName);
  }

  String validateCardHolderNumber(
      NewOnlineRegistrationViewModel newOnlineRegistrationViewModel,
      String cardNumber) {
    return _newOnlineRegistrationRequestUseCase!.validateCardNumber(cardNumber);
  }

  String validateUserPassword(
      NewOnlineRegistrationViewModel newOnlineRegistrationViewModel,
      String password) {
    return _newOnlineRegistrationRequestUseCase!.validateUserPassword(password);
  }

  String validateEmailAddress(
      NewOnlineRegistrationViewModel newOnlineRegistrationViewModel,
      String email) {
    return _newOnlineRegistrationRequestUseCase!.validateEmailAddress(email);
  }
}
