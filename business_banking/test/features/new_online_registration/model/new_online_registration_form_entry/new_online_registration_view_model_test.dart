import 'package:business_banking/features/new_online_registration_form/model/new_online_registration_form_entry/new_online_registration_enums.dart';
import 'package:business_banking/features/new_online_registration_form/model/new_online_registration_form_entry/new_online_registration_view_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Online Registration View Model', () {
    final tViewModel = NewOnlineRegistrationViewModel(
        cardHolderName: 'Tyler',
        cardNumber: '378282246310005',
        email: 'test@test.com',
        userPassword: 'TestPassword@123',
        cardHolderNameStatus: 'cardHolderNameStatus',
        cardNumberStatus: 'cardNumberStatus',
        userEmailStatus: 'userEmailStatus',
        userPasswordStatus: 'userPasswordStatus');

    test('should properties match', () {
      expect(tViewModel.cardHolderName, 'Tyler');
      expect(tViewModel.cardNumber, '378282246310005');
      expect(tViewModel.email, 'test@test.com');
      expect(tViewModel.userPassword, 'TestPassword@123');
      expect(tViewModel.cardHolderNameStatus, 'cardHolderNameStatus');
      expect(tViewModel.userEmailStatus, 'userEmailStatus');
      expect(tViewModel.cardNumberStatus, 'cardNumberStatus');
      expect(tViewModel.serviceResponseStatus,
          NewOnlineRegistrationServiceResponseStatus.unknown);
    });

    test('should props match', () async {
      expect(tViewModel.props, [
        tViewModel.cardHolderName,
        tViewModel.cardNumber,
        tViewModel.email,
        tViewModel.userPassword,
      ]);
    });
  });
}
