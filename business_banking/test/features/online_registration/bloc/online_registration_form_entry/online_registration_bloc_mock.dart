import 'package:business_banking/features/deposit_check/model/enums.dart';
import 'package:business_banking/features/online_registration/bloc/online_registration_bloc.dart';
import 'package:business_banking/features/online_registration/bloc/online_registration_form_entry/online_registration_event.dart';
import 'package:business_banking/features/online_registration/bloc/online_registration_success/online_registration_success_event.dart';
import 'package:business_banking/features/online_registration/model/online_registration_form_entry/online_registration_view_model.dart';
import 'package:business_banking/features/online_registration/model/online_registration_success/online_registration_success_view_model.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:mockito/mockito.dart';

class OnlineRegistrationBlocMock extends Mock
    implements OnlineRegistrationBloc {
  @override
  final Pipe<OnlineRegistrationEvent> onlineRegistrationEventPipe =
      Pipe<OnlineRegistrationEvent>(canSendDuplicateData: true);

  @override
  Pipe<OnlineRegistrationViewModel> onlineRegistrationViewModelPipe =
      Pipe<OnlineRegistrationViewModel>();
  @override
  Pipe<OnlineRegistrationSuccessViewModel>
      onlineRegistrationSuccessViewModelPipe =
      Pipe<OnlineRegistrationSuccessViewModel>();

  @override
  Pipe<OnlineRegistrationSuccessEvent> onlineRegistrationSuccessEventPipe =
      Pipe<OnlineRegistrationSuccessEvent>(canSendDuplicateData: true);

  OnlineRegistrationViewModel onlineRegistrationViewModelSample =
      OnlineRegistrationViewModel(
    cardHolderName: 'Tyler',
    cardNumber: '378282246310005',
    email: 'test@test.com',
    ssnLastFourDigits: '5462',
    userPassword: 'TestPassword@123',
    accountNumberGenerated: '123456789',
    cardHolderNameStatus: '',
    cardNumberStatus: '',
    ssnLastFourDigitsStatus: '',
    userEmailStatus: '',
    userPasswordStatus: '',
    userFormInputStatus: UserInputStatus.valid,
  );

  OnlineRegistrationSuccessViewModel onlineRegistrationSuccessViewModelSample =
      OnlineRegistrationSuccessViewModel(
          cardHolderName: 'Tyler',
          cardNumber: '378282246310005',
          email: 'test@test.com',
          ssnLastFourDigits: '5462',
          userPassword: 'TestPassword@123',
          accountNumberGenerated: '123456789',
          serviceResponseStatus: ServiceResponseStatus.unknown);

  OnlineRegistrationBlocMock() {
    onlineRegistrationViewModelPipe.whenListenedDo(() {
      onlineRegistrationViewModelPipe.send(
        onlineRegistrationViewModelSample,
      );
    });

    onlineRegistrationSuccessViewModelPipe.whenListenedDo(() {
      onlineRegistrationSuccessViewModelPipe.send(
        onlineRegistrationSuccessViewModelSample,
      );
    });
  }
}
