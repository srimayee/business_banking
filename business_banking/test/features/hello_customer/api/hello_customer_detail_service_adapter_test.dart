import 'package:business_banking/features/hello_customer/api/hello_customer_detail_service_response_model.dart';
import 'package:business_banking/features/hello_customer/bloc/hello_customer_detail_service_adapter.dart';
import 'package:business_banking/features/hello_customer/model/hello_customer_detail_entity.dart';
import 'package:business_banking/features/hello_customer/model/hello_customer_entity.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Entity is created by service adapter', () {
    final entity = HelloCustomerDetailServiceAdapter().createEntity(
        HelloCustomerDetailEntity(),
        HelloCustomerDetailServiceResponseModel.fromJson({
          "honrsic": "Mr.",
          "firstName": "Joe",
          "lastName": "A",
          "weather": "sunny",
          "address": "1234 ABCD Rd, City, State 00000"
        }));

    expect(
        entity,
        HelloCustomerDetailEntity(
            customerEntity: HelloCustomerEntity(
                honrsic: "Mr.", firstName: "Joe", lastName: "A"),
            weather: "sunny",
            address: "1234 ABCD Rd, City, State 00000"));
  });
}
