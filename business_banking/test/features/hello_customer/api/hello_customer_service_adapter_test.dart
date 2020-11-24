import 'package:business_banking/features/hello_customer/api/hello_customer_service_response_model.dart';
import 'package:business_banking/features/hello_customer/bloc/hello_customer_service_adapter.dart';
import 'package:business_banking/features/hello_customer/model/hello_customer_entity.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Entity is created by service adapter', () {
    final entity = HelloCustomerServiceAdapter().createEntity(
        HelloCustomerEntity(),
        HelloCustomerServiceResponseModel.fromJson({
          "honrsic": "Mr.",
          "firstName": "Joe",
          "lastName": "A",
          "accountType": "private",
          "nickName": ""
        }));

    expect(
        entity,
        HelloCustomerEntity(
            honrsic: "Mr.",
            firstName: "Joe",
            lastName: "A",
            accountType: AccountType.private,
            nickName: ""));
  });
}
