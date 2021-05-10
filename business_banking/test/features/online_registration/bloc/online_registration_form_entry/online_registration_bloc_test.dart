// @dart=2.9
import 'package:business_banking/features/deposit_check/model/enums.dart';
import 'package:business_banking/features/online_registration/bloc/online_registration_bloc.dart';
import 'package:business_banking/features/online_registration/bloc/online_registration_form_entry/online_registration_event.dart';
import 'package:business_banking/features/online_registration/bloc/online_registration_form_entry/online_registration_usecase.dart';
import 'package:business_banking/features/online_registration/model/online_registration_form_entry/online_registration_view_model.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

class MockOnlineRegistrationUseCase extends Mock
    implements OnlineRegistrationUseCase {}

void main() {
  OnlineRegistrationBloc bloc;
  MockOnlineRegistrationUseCase mockOnlineRegistrationUseCase;

  setUp(() {
    mockOnlineRegistrationUseCase = MockOnlineRegistrationUseCase();

    bloc = OnlineRegistrationBloc(
      onlineRegistrationUseCase: mockOnlineRegistrationUseCase,
    );
  });

  tearDown(() {
    bloc.dispose();
    expect(bloc.onlineRegistrationViewModelPipe.receive, emitsDone);
    expect(bloc.onlineRegistrationEventPipe.receive, emitsDone);
  });
  group('OnlineRegistration Bloc', () {
    OnlineRegistrationViewModel onlineRegistrationViewModelSucceed =
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
            serviceResponseStatus: ServiceResponseStatus.succeed);

    test(
        'should onlineRegistrationViewModelPipe gets view model with real usecase',
        () {
      bloc.onlineRegistrationViewModelPipe
          .send(onlineRegistrationViewModelSucceed);
      bloc.onlineRegistrationViewModelPipe.receive.listen((model) {
        verify(mockOnlineRegistrationUseCase.execute()).called(1);
      });
    });
    test(
        'should onlineRegistrationViewModelPipe gets view model with real usecase',
        () {
      bloc.onlineRegistrationViewModelPipe
          .send(onlineRegistrationViewModelSucceed);
      bloc.onlineRegistrationViewModelPipe.receive.listen((model) {
        verify(mockOnlineRegistrationUseCase.execute()).called(1);
      });
    });
    test('should onlineRegistrationEventPipeHandler calls correct method', () {
      bloc.onlineRegistrationEventPipe.receive.listen((event) {
        if (event is UpdateCardHolderNameEvent) {
          verify(mockOnlineRegistrationUseCase.updateCardHolderName('Tyler'))
              .called(1);
        }
        if (event is UpdateCardNumberEvent) {
          verify(mockOnlineRegistrationUseCase
                  .updateCreditCardNumber('379260567141018'))
              .called((1));
        }
        if (event is UpdateSSNLastFourDigitsEvent) {
          verify(mockOnlineRegistrationUseCase.updateSsnLastFourDigits('5346'))
              .called(1);
        }
        if (event is UpdateUserEmailEvent) {
          verify(mockOnlineRegistrationUseCase.updateEmail('test@test.com'))
              .called(1);
        }
        if (event is UpdateUserPasswordEvent) {
          verify(mockOnlineRegistrationUseCase.updateUserPassword('Test@123'))
              .called((1));
        }
        if (event is SubmitOnlineRegistrationEvent) {
          verify(mockOnlineRegistrationUseCase.submitForm()).called((1));
        }
      });

      bloc.onlineRegistrationEventPipeHandler(
          UpdateCardHolderNameEvent('Tyler'));
      bloc.onlineRegistrationEventPipeHandler(
          UpdateCardNumberEvent('379260567141018'));
      bloc.onlineRegistrationEventPipeHandler(
          UpdateSSNLastFourDigitsEvent('5346'));
      bloc.onlineRegistrationEventPipeHandler(
          UpdateUserEmailEvent('test@test.com'));
      bloc.onlineRegistrationEventPipeHandler(
          UpdateUserPasswordEvent('Test@123'));
      bloc.onlineRegistrationEventPipeHandler(SubmitOnlineRegistrationEvent());
    });
    test('should error update the form fields', () async {
      mockOnlineRegistrationUseCase.updateCardHolderName('Tyler');
      bloc.onlineRegistrationEventPipe.send(UpdateCardHolderNameEvent('Tyler'));
      bloc.onlineRegistrationViewModelPipe.receive.listen(
        (event) {
          expect(event.cardHolderName, '');
        },
      );
      // mockOnlineRegistrationUseCase.updateCreditCardNumber('');
      // bloc.onlineRegistrationEventPipe.send(UpdateCardNumberEvent(''));
      // bloc.onlineRegistrationViewModelPipe.receive.listen(
      //   (event) {
      //     expect(event.cardNumber, '');
      //   },
      // );
      // mockOnlineRegistrationUseCase.updateSsnLastFourDigits('');
      // bloc.onlineRegistrationEventPipe.send(UpdateSSNLastFourDigitsEvent(''));
      // bloc.onlineRegistrationViewModelPipe.receive.listen(
      //   (event) {
      //     expect(event.ssnLastFourDigits, '');
      //   },
      // );
      // mockOnlineRegistrationUseCase.updateEmail('');
      // bloc.onlineRegistrationEventPipe.send(UpdateUserEmailEvent(''));
      // bloc.onlineRegistrationViewModelPipe.receive.listen(
      //   (event) {
      //     expect(event.email, '');
      //   },
      // );
      // mockOnlineRegistrationUseCase.updateUserPassword('');
      // bloc.onlineRegistrationEventPipe.send(UpdateUserPasswordEvent(''));
      // bloc.onlineRegistrationViewModelPipe.receive.listen(
      //   (event) {
      //     expect(event.userPassword, '');
      //   },
      // );
    });
  });
}
