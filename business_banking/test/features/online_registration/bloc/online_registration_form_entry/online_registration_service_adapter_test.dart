// @dart=2.9
import 'package:business_banking/features/online_registration/api/online_registration_service_request_model.dart';
import 'package:business_banking/features/online_registration/api/online_registration_service_response_model.dart';
import 'package:business_banking/features/online_registration/bloc/online_registration_form_entry/online_registration_service_adapter.dart';
import 'package:business_banking/features/online_registration/model/online_registration_form_entry/online_registration_entity.dart';
import 'package:test/test.dart';

void main() {
  group('Online Registration service adapter test', () {
    final tEntity = OnlineRegistrationEntity(
        errors: [],
        cardHolderName: 'Tyler',
        cardNumber: '378282246310005',
        ssnLastFourDigits: '5462',
        email: 'test@test.com',
        userPassword: 'TestPassword@123',
        accountNumberGenerated: '123456789');

    final tRequestModel = OnlineRegistrationServiceRequestModel(
      cardHolderName: 'Tyler',
      cardNumber: '378282246310005',
      ssnLastFourDigits: '5462',
      email: 'test@test.com',
      userPassword: 'TestPassword@123',
    );

    final tJsonResponse = {
      "status": "Successful",
      "didSucceed": true,
      "accountNumberGenerated": "123456789"
    };

    test('should received a json response and return account number generated',
        () async {
      final entity = OnlineRegistrationServiceAdapter().createEntity(
          OnlineRegistrationEntity(),
          OnlineRegistrationServiceResponseModel.fromJson(tJsonResponse));
      expect(entity.accountNumberGenerated, tEntity.accountNumberGenerated);
    });
    test(
        'should receive a OnlineRegistrationEntity and return OnlineRegistrationServiceRequestModel',
        () async {
      final requestModel =
          OnlineRegistrationServiceAdapter().createRequest(tEntity);
      expect(requestModel.cardHolderName, tRequestModel.cardHolderName);
      expect(requestModel.cardNumber, tRequestModel.cardNumber);
      expect(requestModel.email, tRequestModel.email);
      expect(requestModel.ssnLastFourDigits, tRequestModel.ssnLastFourDigits);
      expect(requestModel.userPassword, tRequestModel.userPassword);
    });
  });
}
