// @dart=2.9
import 'package:business_banking/features/deposit_check/model/enums.dart';
import 'package:business_banking/features/online_registration/model/online_registration_success/online_registration_success_view_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Online Registration View Model', () {
    final tViewModel = OnlineRegistrationSuccessViewModel(
        cardHolderName: 'Tyler',
        cardNumber: '378282246310005',
        email: 'test@test.com',
        ssnLastFourDigits: '5462',
        userPassword: 'TestPassword@123',
        accountNumberGenerated: '123456789',
        serviceResponseStatus: ServiceResponseStatus.unknown);

    test('should properties match', () {
      expect(tViewModel.cardHolderName, 'Tyler');
      expect(tViewModel.cardNumber, '378282246310005');
      expect(tViewModel.email, 'test@test.com');
      expect(tViewModel.ssnLastFourDigits, '5462');
      expect(tViewModel.userPassword, 'TestPassword@123');
      expect(tViewModel.accountNumberGenerated, '123456789');
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
