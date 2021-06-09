import 'package:business_banking/features/login/bloc/login_bloc.dart';
import 'package:business_banking/features/login/model/login_view_model.dart';
import 'package:business_banking/features/new_online_registration_form/model/new_online_registration_form_entry/new_online_registration_enums.dart';
import 'package:business_banking/features/new_online_registration_form/model/new_online_registration_success/new_online_registration_success_view_model.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:mockito/mockito.dart';

class LoginBlocMock extends Mock implements LoginBloc {
  @override
  final loginViewModelPipe = Pipe<LoginViewModel>();

  @override
  final userNamePipe = Pipe<String>();
  @override
  final passwordPipe = Pipe<String>();
  @override
  final submitPipe = EventPipe();

  LoginViewModel loginViewModel = LoginViewModel(
    username: 'Tyler',
    password: 'TestPassword@123',
    dataStatus: DataStatus.valid,
    serviceStatus: ServiceStatus.success,
  );

  NewOnlineRegistrationRequestSuccessViewModel
      onlineRegistrationSuccessViewModelSample =
      NewOnlineRegistrationRequestSuccessViewModel(
          cardHolderName: 'Tyler',
          accountNumberGenerated: '123456789',
          serviceResponseStatus:
              NewOnlineRegistrationServiceResponseStatus.unknown);

  LoginBlocMock() {
    loginViewModelPipe.whenListenedDo(() {
      loginViewModelPipe.send(
        loginViewModel,
      );
    });
  }
}
