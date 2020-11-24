import 'package:business_banking/features/hello_customer/api/hello_customer_detail_service.dart';
import 'package:business_banking/features/hello_customer/api/hello_customer_detail_service_response_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('HelloCustomerDetailService success', () async {
    final service = HelloCustomerDetailService();
    final eitherResponse = await service.request();

    expect(eitherResponse.isRight, isTrue);
    expect(
        eitherResponse.fold((_) {}, (m) => m),
        HelloCustomerDetailServiceResponseModel.fromJson({
          "honrsic": "Mr.",
          "firstName": "Joe",
          "lastName": "A",
          "weather": "sunny",
          "address": "1234 ABCD Rd, City, State 00000"
        }));
  });
}
