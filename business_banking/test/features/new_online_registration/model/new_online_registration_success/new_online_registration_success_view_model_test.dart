// @dart=2.9
import 'package:business_banking/features/new_online_registration_form/model/new_online_registration_form_entry/new_online_registration_enums.dart';
import 'package:business_banking/features/new_online_registration_form/model/new_online_registration_success/new_online_registration_success_view_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Online Registration View Model', () {
    final tViewModel = NewOnlineRegistrationRequestSuccessViewModel(
        cardHolderName: 'Tyler',
        cardNumber: '378282246310005',
        validThru: '08/50',
        email: 'test@test.com',
        userPassword: 'TestPassword@123',
        accountNumberGenerated: '123456789',
        serviceResponseStatus:
            NewOnlineRegistrationServiceResponseStatus.unknown);

    test('should properties match', () {
      expect(tViewModel.cardHolderName, 'Tyler');
      expect(tViewModel.cardNumber, '378282246310005');
      expect(tViewModel.validThru, '08/50');
      expect(tViewModel.email, 'test@test.com');
      expect(tViewModel.userPassword, 'TestPassword@123');
      expect(tViewModel.accountNumberGenerated, '123456789');
      expect(tViewModel.serviceResponseStatus,
          NewOnlineRegistrationServiceResponseStatus.unknown);
    });

    test('should props match', () async {
      expect(tViewModel.props, [
        tViewModel.cardHolderName,
        tViewModel.cardNumber,
        tViewModel.validThru,
        tViewModel.email,
        tViewModel.userPassword,
        tViewModel.accountNumberGenerated,
      ]);
    });
  });
}
