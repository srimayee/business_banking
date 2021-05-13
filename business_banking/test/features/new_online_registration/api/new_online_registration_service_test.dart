// @dart=2.9
import 'package:business_banking/core/patch_simple_rest_api.dart';
import 'package:business_banking/features/new_online_registration_form/api/new_online_registration_service.dart';
import 'package:business_banking/features/new_online_registration_form/api/new_online_registration_service_request_model.dart';
import 'package:business_banking/features/new_online_registration_form/api/new_online_registration_service_response_model.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:test/test.dart';

void main() {
  NewOnlineRegistrationService service;
  final String baseUrl = "http://localhost:3001/";
  PatchSimpleRestApi api = PatchSimpleRestApi(baseUrl: baseUrl);

  setUp(() {
    service = NewOnlineRegistrationService();
  });

  group('NewOnlineRegistrationService Test', () {
    final tJsonResponse = {
      "didSucceed": true,
      "accountNumberGenerated": "123456789"
    };

    test('should perform a POST request', () async {
      final eitherResponse = await service.request();
      expect(eitherResponse.isRight, isTrue);
    });

    test(
        'should return NewOnlineRegistrationServiceResponseModel when the response is success',
        () async {
      final eitherResponse = await service.request(
          requestModel: NewOnlineRegistrationServiceRequestModel(
        cardHolderName: 'Test',
        cardNumber: '12345',
        email: 'test@test.com',
        userPassword: 'Test123test',
      ));
      expect(eitherResponse.fold((_) {}, (m) => m),
          NewOnlineRegistrationServiceResponseModel.fromJson(tJsonResponse));
    });

    test("RestAPI POST call", () async {
      RestResponse resp = await api.request(
          method: RestMethod.post, path: 'create-new-account');
      expect(resp.type, RestResponseType.success);
      expect(
        resp.content,
        "{\n  \"didSucceed\" : true,\n  \"accountNumberGenerated\" : \"123456789\"\n}",
      );
    });

    test('NewOnlineRegistrationService parseResponse', () async {
      final json = {
        'cardHolderName': 'Test',
        'cardNumber': '12345',
        'email': 'test@test.com',
        'userPassword': ''
      };

      final service = NewOnlineRegistrationService();

      NewOnlineRegistrationServiceResponseModel response =
          service.parseResponse(json);

      expect(
          response, NewOnlineRegistrationServiceResponseModel.fromJson(json));
    });
  });
}
