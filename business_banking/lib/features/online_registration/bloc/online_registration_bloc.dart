import 'package:business_banking/features/login/api/login_service.dart';
import 'package:business_banking/features/online_registration/bloc/online_registration_usecase.dart';
import 'package:business_banking/features/online_registration/model/online_registration_view_model.dart';
import 'package:clean_framework/clean_framework.dart';

class OnlineRegistrationBloc extends Bloc {
  late OnlineRegistrationUseCase _onlineRegistrationUseCase;

  final onlineRegistrationViewModelPipe = Pipe<OnlineRegistrationViewModel>();
  final cardHolderNamePipe = Pipe<String>();
  final cardNumberPipe = Pipe<String>();
  final ssnLastFourDigitsPipe = Pipe<String>();
  final emailPipe = Pipe<String>();
  final userPasswordPipe = Pipe<String>();
  final submitPipe = EventPipe();

  //Replace service
  OnlineRegistrationBloc({LoginService? loginService}) {
    _onlineRegistrationUseCase = OnlineRegistrationUseCase((viewModel) =>
        onlineRegistrationViewModelPipe
            .send(viewModel as OnlineRegistrationViewModel));
    onlineRegistrationViewModelPipe.whenListenedDo(() {
      _onlineRegistrationUseCase.create();
    });
    cardHolderNamePipe.receive.listen(cardHolderNameHandler);
    cardNumberPipe.receive.listen(cardNumberInputHandler);
    ssnLastFourDigitsPipe.receive.listen(ssnLastFourDigitsInputHandler);
    emailPipe.receive.listen(userEmailInputHandler);
    userPasswordPipe.receive.listen(userPasswordInputHandler);
    submitPipe.listen(submitHandler);
  }

  void cardHolderNameHandler(String cardHolderName) {
    _onlineRegistrationUseCase.updateCardHolderName(cardHolderName);
  }

  void cardNumberInputHandler(String cardNumber) {
    _onlineRegistrationUseCase.updateCardNumber(cardNumber);
  }

  void ssnLastFourDigitsInputHandler(String ssnLastFourDigits) {
    _onlineRegistrationUseCase.updateSsnLastFourDigits(ssnLastFourDigits);
  }

  void userEmailInputHandler(String email) {
    _onlineRegistrationUseCase.updateEmail(email);
  }

  void userPasswordInputHandler(String userPassword) {
    print('Password from bloc: ${userPassword}');
    _onlineRegistrationUseCase.updateUserPassword(userPassword);
  }

  void submitHandler() {
    print('submitted from bloc:}');
    _onlineRegistrationUseCase.submit();
  }

  @override
  void dispose() {
    onlineRegistrationViewModelPipe.dispose();
    cardHolderNamePipe.dispose();
    cardNumberPipe.dispose();
    ssnLastFourDigitsPipe.dispose();
    emailPipe.dispose();
    userPasswordPipe.dispose();
    submitPipe.dispose();
  }
}
