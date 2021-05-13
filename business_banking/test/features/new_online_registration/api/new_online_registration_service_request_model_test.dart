import 'package:business_banking/features/new_online_registration_form/api/new_online_registration_service_request_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final viewModel = NewOnlineRegistrationServiceRequestModel(
    cardHolderName: 'Test',
    cardNumber: '12345',
    email: 'test@test.com',
    userPassword: 'Test123test',
  );
  test('NewOnlineRegistrationServiceRequestModel initialize', () async {
    expect(viewModel.cardHolderName, 'Test');
    expect(viewModel.cardNumber, '12345');
    expect(viewModel.email, 'test@test.com');
    expect(viewModel.userPassword, 'Test123test');
  });

  test('NewOnlineRegistrationServiceRequestModel toJson', () async {
    expect(viewModel.toJson(), {
      'cardHolderName': 'Test',
      'cardNumber': '12345',
      'email': 'test@test.com',
      'userPassword': 'Test123test',
    });
  });
  test('NewOnlineRegistrationServiceRequestModel toJson with empty objects',
      () async {
    final viewModel = NewOnlineRegistrationServiceRequestModel(
      cardHolderName: '',
      cardNumber: '',
      email: '',
      userPassword: '',
    );

    expect(viewModel.toJson(), {
      'cardHolderName': '',
      'cardNumber': '',
      'email': '',
      'userPassword': '',
    });
  });
  test('should props match', () async {
    expect(viewModel.props, [
      viewModel.cardHolderName,
      viewModel.cardNumber,
      viewModel.email,
      viewModel.userPassword,
    ]);
  });
}
