// @dart=2.9
import 'package:business_banking/features/online_registration/bloc/online_registration_form_entry/online_registration_usecase.dart';
import 'package:business_banking/features/online_registration/model/online_registration_form_entry/online_registration_entity.dart';
import 'package:business_banking/features/online_registration/model/online_registration_form_entry/online_registration_enums.dart';
import 'package:business_banking/features/online_registration/model/online_registration_form_entry/online_registration_view_model.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  OnlineRegistrationUseCase useCase;

  OnlineRegistrationViewModel onlineRegistrationViewModel;

  setUp(() {
    useCase = OnlineRegistrationUseCase((viewModel) {
      onlineRegistrationViewModel = viewModel;
      return true;
    });
  });

  group('Online Registration UseCase', () {
    test('should value receive from pipe be the same as source value',
        () async {
      useCase.execute();
      expect(OnlineRegistrationViewModel, isNotNull);
    });
    test(
        'should updates for CardHolderName, number, ssn, email, password method receive data and update view Model',
        () async {
      useCase.updateCardHolderName('Tyler');
      expect(onlineRegistrationViewModel.cardHolderName, 'Tyler');
      useCase.updateCreditCardNumber('378282246310005');
      expect(onlineRegistrationViewModel.cardNumber, '378282246310005');
      useCase.updateEmail('test@test.com');
      expect(onlineRegistrationViewModel.email, 'test@test.com');
      useCase.updateSsnLastFourDigits('5462');
      expect(onlineRegistrationViewModel.ssnLastFourDigits, '5462');
      useCase.updateUserPassword('TestPassword@123');
      expect(onlineRegistrationViewModel.userPassword, 'TestPassword@123');
    });
    test(
        'should updateCardHolderName method return a status and invalid UserFormInputStatus, if user insert not valid Name',
        () async {
      useCase.updateCardHolderName('12345');
      expect(onlineRegistrationViewModel.userFormInputStatus,
          UserFormInputStatus.invalid);
      expect(onlineRegistrationViewModel.cardHolderNameStatus,
          'Please, provide a valid name.');
    });
    test(
        'should updateCreditCardNumber method return a status and invalid UserFormInputStatus, if user insert not valid Card Number',
        () async {
      useCase.updateCreditCardNumber('123454');
      expect(onlineRegistrationViewModel.userFormInputStatus,
          UserFormInputStatus.invalid);
      expect(onlineRegistrationViewModel.cardNumberStatus,
          'Enter valid credit card number.');
    });

    test(
        'should updateSsnLastFourDigits method return a status and invalid UserFormInputStatus, if user insert not valid SSN',
        () async {
      useCase.updateSsnLastFourDigits('123D');
      expect(onlineRegistrationViewModel.userFormInputStatus,
          UserFormInputStatus.invalid);
      expect(onlineRegistrationViewModel.ssnLastFourDigitsStatus,
          'SSN Number is not valid.');
    });

    test(
        'should updateEmail method return a status and invalid UserFormInputStatus, if user insert not valid Email address',
        () async {
      useCase.updateEmail('sample');
      expect(onlineRegistrationViewModel.userFormInputStatus,
          UserFormInputStatus.invalid);
      expect(onlineRegistrationViewModel.userEmailStatus,
          'Please, provide a valid email.');
    });

    test(
        'should updateUserPassword method return a status and invalid UserFormInputStatus, if user insert not valid UserPassword',
        () async {
      useCase.updateUserPassword('sample');
      expect(onlineRegistrationViewModel.userFormInputStatus,
          UserFormInputStatus.invalid);
      expect(onlineRegistrationViewModel.userPasswordStatus,
          'Password should be minimum eight characters, at least one uppercase letter, one lowercase letter and one number.');
    });

    test('should submit form with valid data', () async {
      final tEntity = OnlineRegistrationEntity(
          errors: [],
          cardHolderName: 'Tyler',
          cardNumber: '378282246310005',
          ssnLastFourDigits: '5462',
          email: 'test@test.com',
          userPassword: 'TestPassword@123',
          accountNumberGenerated: '123456789');
      onlineRegistrationViewModel =
          useCase.buildViewModelForServiceUpdate(tEntity);
      useCase.submitForm();
      expect(onlineRegistrationViewModel.serviceResponseStatus,
          ServiceResponseStatus.succeed);
    });

    test(
        'should service response be failed when built view model with entity that has error',
        () async {
      final tEntity = OnlineRegistrationEntity(
          errors: [EntityFailure()],
          cardHolderName: '',
          cardNumber: '378282246310005',
          ssnLastFourDigits: '5462',
          email: 'test@test.com',
          userPassword: 'TestPassword@123',
          accountNumberGenerated: '123456789');
      onlineRegistrationViewModel =
          useCase.buildViewModelForServiceUpdate(tEntity);

      expect(onlineRegistrationViewModel.serviceResponseStatus,
          ServiceResponseStatus.failed);
    });
  });
}

//  test('should resetViewModel method reset view model', () async {
//       useCase.resetViewModel();

//       expect(OnlineRegistrationViewModel.depositAmount, 0.0);
//       expect(OnlineRegistrationViewModel.depositAmountStatus, '');
//       expect(OnlineRegistrationViewModel.userEmail, '');
//       expect(OnlineRegistrationViewModel.userEmailStatus, '');
//       expect(OnlineRegistrationViewModel.referenceNumber, '');
//       expect(OnlineRegistrationViewModel.UserFormInputStatus, UserFormInputStatus.unknown);
//     });
