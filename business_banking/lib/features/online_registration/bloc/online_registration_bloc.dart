import 'package:business_banking/features/online_registration/bloc/online_registration_form_entry/online_registration_event.dart';
import 'package:business_banking/features/online_registration/bloc/online_registration_form_entry/online_registration_usecase.dart';
import 'package:business_banking/features/online_registration/bloc/online_registration_success/online_registration_success_usecase.dart';
import 'package:business_banking/features/online_registration/model/online_registration_form_entry/online_registration_view_model.dart';
import 'package:business_banking/features/online_registration/model/online_registration_success/online_registration_success_view_model.dart';
import 'package:clean_framework/clean_framework.dart';

class OnlineRegistrationBloc extends Bloc {
  OnlineRegistrationUseCase? _onlineRegistrationUseCase;
  OnlineRegistrationSuccessUseCase? _onlineRegistrationSuccessUseCase;

  final onlineRegistrationViewModelPipe = Pipe<OnlineRegistrationViewModel>();
  final onlineRegistrationEventPipe =
      Pipe<OnlineRegistrationEvent>(canSendDuplicateData: true); //false?

  final onlineRegistrationSuccessViewModelPipe =
      Pipe<OnlineRegistrationSuccessViewModel>();
  // final onlineRegistrationSuccessEventPipe =
  //     Pipe<OnlineRegistrationSuccessEvent>(canSendDuplicateData: true);

  OnlineRegistrationBloc(
      {OnlineRegistrationUseCase? onlineRegistrationUseCase,
      OnlineRegistrationSuccessUseCase? onlineRegistrationSuccessUseCase}) {
    _onlineRegistrationUseCase = onlineRegistrationUseCase ??
        OnlineRegistrationUseCase(onlineRegistrationViewModelPipe.send);
    onlineRegistrationViewModelPipe.whenListenedDo(
      () {
        _onlineRegistrationUseCase!.execute();
      },
    );
    onlineRegistrationEventPipe.receive
        .listen(onlineRegistrationEventPipeHandler);

    _onlineRegistrationSuccessUseCase = onlineRegistrationSuccessUseCase ??
        OnlineRegistrationSuccessUseCase(
            onlineRegistrationSuccessViewModelPipe.send);
    onlineRegistrationSuccessViewModelPipe.whenListenedDo(
      () {
        _onlineRegistrationSuccessUseCase!.execute();
      },
    );
    // onlineRegistrationSuccessEventPipe.receive
    //     .listen(onlineRegistrationSuccessEventPipeHandler);
  }
  //
  // void onlineRegistrationSuccessEventPipeHandler(
  //     OnlineRegistrationSuccessEvent event) {
  //   if (event is ResetOnlineRegistrationViewModelEvent) {
  //     _onlineRegistrationSuccessUseCase!.resetViewModel();
  //   }
  // }

  void onlineRegistrationEventPipeHandler(OnlineRegistrationEvent event) {
    if (event is UpdateCardHolderNameEvent) {
      _onlineRegistrationUseCase!.updateCardHolderName(event.cardHolderName);
    } else if (event is UpdateCardNumberEvent) {
      _onlineRegistrationUseCase!.updateCreditCardNumber(event.cardNumber);
    } else if (event is UpdateUserEmailEvent) {
      _onlineRegistrationUseCase!.updateEmail(event.email);
    } else if (event is UpdateSSNLastFourDigitsEvent) {
      _onlineRegistrationUseCase!
          .updateSsnLastFourDigits(event.ssnLastFourDigits);
    } else if (event is UpdateUserPasswordEvent) {
      _onlineRegistrationUseCase!.updateUserPassword(event.userPassword);
    } else if (event is SubmitOnlineRegistrationEvent) {
      _onlineRegistrationUseCase!.submitForm();
    }
  }

  @override
  void dispose() {
    onlineRegistrationViewModelPipe.dispose();
    onlineRegistrationEventPipe.dispose();
    onlineRegistrationSuccessViewModelPipe.dispose();
    // onlineRegistrationSuccessEventPipe.dispose();
  }
}
