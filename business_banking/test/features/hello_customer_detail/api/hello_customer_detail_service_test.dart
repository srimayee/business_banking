import 'package:business_banking/features/hello_customer_detail/api/hello_customer_detail_service.dart';
import 'package:business_banking/features/hello_customer_detail/api/hello_customer_detail_service_response_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('HelloCustomerDetailService success', () async {
    final service = HelloCustomerDetailService();
    final eitherResponse = await service.request();

    expect(eitherResponse.isRight, isTrue);
    expect(
        eitherResponse.fold((_) {}, (m) => m),
        HelloCustomerDetailServiceResponseModel.fromJson(
            {'name': 'Joe', 'datetime': '10/20/2020 13:00'}));
  });
}
