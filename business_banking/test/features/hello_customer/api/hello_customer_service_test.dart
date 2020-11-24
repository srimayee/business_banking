import 'package:business_banking/features/hello_customer/api/hello_customer_service.dart';
import 'package:business_banking/features/hello_customer/api/hello_customer_service_response_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('HelloCustomerService success', () async {
    final service = HelloCustomerService();
    final eitherResponse = await service.request();

    expect(eitherResponse.isRight, isTrue);
    expect(
        eitherResponse.fold((_) {}, (m) => m),
        HelloCustomerServiceResponseModel.fromJson({
          "honrsic": "Mr.",
          "firstName": "Joe",
          "lastName": "A",
          "accountType": "private",
          "nickName": ""
        }));
  });
}
