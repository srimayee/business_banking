import 'package:business_banking/features/customer/api/customer_service_response_model.dart';
import 'package:business_banking/features/customer/bloc/customer_service_adapter.dart';
import 'package:business_banking/features/customer/model/customer_entity.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Entity is created by service adapter', () {
    final entity = CustomerServiceAdapter().createEntity(
        CustomerEntity(),
        CustomerServiceResponseModel.fromJson({
          "honorific": "Mr.",
          "firstName": "Joe",
          "lastName": "A",
          "accountType": "private",
          "nickName": "",
          "address": "1234 ABCD Rd, City, State 00000"
        }));

    expect(
        entity,
        CustomerEntity(
            honorific: "Mr.",
            firstName: "Joe",
            lastName: "A",
            accountType: AccountType.private,
            nickName: "",
            address: "1234 ABCD Rd, City, State 00000"));
  });
}
