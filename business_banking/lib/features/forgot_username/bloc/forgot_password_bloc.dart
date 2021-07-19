import 'package:business_banking/features/forgot_username/model/forgot_password_view_model.dart';
import 'package:clean_framework/clean_framework.dart';

import 'forgot_password_usecase.dart';

class ForgotPasswordBloc extends Bloc {
  late ForgotPasswordUseCase _loginUseCase;

  final forgotPasswordModelPipe = Pipe<ForgotPasswordViewModel>();
  final emailPipe = Pipe<String>();
  final submitPipe = EventPipe();

  ForgotPasswordBloc() {
    _loginUseCase =
        ForgotPasswordUseCase((viewModel) => forgotPasswordModelPipe.send(viewModel as ForgotPasswordViewModel));
    forgotPasswordModelPipe.whenListenedDo(() {
      _loginUseCase.create();
    });
    emailPipe.receive.listen(emailInputHandler);
    submitPipe.listen(submitHandler);
  }

  void emailInputHandler(String email) {
    _loginUseCase.updateEmail(email);
  }

  void submitHandler() {
    _loginUseCase.submit();
  }

  @override
  void dispose() {
    forgotPasswordModelPipe.dispose();
    emailPipe.dispose();
    submitPipe.dispose();
  }
}
