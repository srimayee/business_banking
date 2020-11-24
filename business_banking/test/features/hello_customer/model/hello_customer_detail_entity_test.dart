import 'package:business_banking/features/hello_customer/model/hello_customer_detail_entity.dart';
import 'package:business_banking/features/hello_customer/model/hello_customer_entity.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('HelloCustomerDetailEntity properties', () {
    final entity = HelloCustomerDetailEntity(
        customerEntity: HelloCustomerEntity(
            honrsic: "Mr.", firstName: "Joe", lastName: "A"),
        weather: "sunny",
        address: "1234 ABCD Rd, City, State 00000");
    expect(entity.customerEntity.honrsic, "Mr.");
    expect(entity.customerEntity.firstName, "Joe");
    expect(entity.customerEntity.lastName, "A");
    expect(entity.weather, "sunny");
    expect(entity.address, "1234 ABCD Rd, City, State 00000");

    expect(entity.toString(), "Mr. Joe A  AccountType.private sunny 1234 ABCD Rd, City, State 00000");
  });

  test('HelloCustomerDetailEntity merge with errors = null', () {
    final entity = HelloCustomerDetailEntity(
        customerEntity: HelloCustomerEntity(
            honrsic: "Mr.", firstName: "Joe", lastName: "A"),
        weather: "sunny",
        address: "1234 ABCD Rd, City, State 00000");
    entity.merge(errors: null);
    expect(entity.customerEntity.honrsic, "Mr.");
    expect(entity.customerEntity.firstName, "Joe");
    expect(entity.customerEntity.lastName, "A");
    expect(entity.weather, "sunny");
    expect(entity.address, "1234 ABCD Rd, City, State 00000");
  });
}
