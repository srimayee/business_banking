import 'package:business_banking/features/online_registration/model/online_registration_form_entry/online_registration_enums.dart';
import 'package:business_banking/features/online_registration/model/online_registration_form_entry/online_registration_view_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Online Registration View Model', () {
    final tViewModel = OnlineRegistrationViewModel(
        cardHolderName: 'Tyler',
        cardNumber: '378282246310005',
        email: 'test@test.com',
        ssnLastFourDigits: '5462',
        userPassword: 'TestPassword@123',
        accountNumberGenerated: '123456789',
        cardHolderNameStatus: 'cardHolderNameStatus',
        cardNumberStatus: 'cardNumberStatus',
        ssnLastFourDigitsStatus: 'ssnLastFourDigitsStatus',
        userEmailStatus: 'userEmailStatus',
        userPasswordStatus: 'userPasswordStatus',
        userFormInputStatus: UserFormInputStatus.unknown,
        serviceResponseStatus: ServiceResponseStatus.unknown);

    test('should properties match', () {
      expect(tViewModel.cardHolderName, 'Tyler');
      expect(tViewModel.cardNumber, '378282246310005');
      expect(tViewModel.email, 'test@test.com');
      expect(tViewModel.ssnLastFourDigits, '5462');
      expect(tViewModel.userPassword, 'TestPassword@123');
      expect(tViewModel.accountNumberGenerated, '123456789');
      expect(tViewModel.cardHolderNameStatus, 'cardHolderNameStatus');
      expect(tViewModel.userEmailStatus, 'userEmailStatus');
      expect(tViewModel.ssnLastFourDigitsStatus, 'ssnLastFourDigitsStatus');
      expect(tViewModel.cardNumberStatus, 'cardNumberStatus');
      expect(tViewModel.userFormInputStatus, UserFormInputStatus.unknown);
      expect(tViewModel.serviceResponseStatus, ServiceResponseStatus.unknown);
    });

    test('should props match', () async {
      expect(tViewModel.props, [
        tViewModel.cardHolderName,
        tViewModel.cardNumber,
        tViewModel.ssnLastFourDigits,
        tViewModel.email,
        tViewModel.userPassword,
        tViewModel.accountNumberGenerated,
      ]);
    });
  });
}
