import 'package:business_banking/features/hello_customer_detail/api/hello_customer_detail_service_response_model.dart';
import 'package:business_banking/features/hello_customer_detail/bloc/hello_customer_detail_service_adapter.dart';
import 'package:business_banking/features/hello_customer_detail/model/hello_customer_detail_entity.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Entity is created by service adapter', () {
    final entity = HelloCustomerDetailServiceAdapter().createEntity(
        HelloCustomerDetailEntity(),
        HelloCustomerDetailServiceResponseModel.fromJson(
            {'name': 'Joe', "datetime": "10/20/2020 13:00"}));

    expect(
        entity,
        HelloCustomerDetailEntity(
            name: 'Joe', currentTimeString: "10/20/2020 13:00"));
  });
}
