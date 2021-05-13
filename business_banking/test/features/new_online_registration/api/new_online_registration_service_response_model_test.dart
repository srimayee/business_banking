import 'package:business_banking/features/new_online_registration_form/api/new_online_registration_service_response_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('NewOnlineRegistrationServiceResponseModel initialize', () async {
    final viewModel = NewOnlineRegistrationServiceResponseModel.fromJson({
      'didSucceed': true,
      'accountNumberGenerated': '123456789',
    });

    expect(viewModel.didSucceed, true);
    expect(viewModel.accountNumberGenerated, '123456789');
    expect(viewModel.props, [
      viewModel.didSucceed,
      viewModel.accountNumberGenerated,
    ]);
  });
}
