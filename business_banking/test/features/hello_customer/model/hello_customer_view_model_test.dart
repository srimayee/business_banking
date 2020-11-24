import 'package:business_banking/features/hello_customer/model/hello_customer_view_model.dart';
import 'package:business_banking/features/hello_customer/model/hello_customer_entity.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('HelloCustomerViewModel initialize', () {
    final viewModel = HelloCustomerViewModel(
        customerEntity: HelloCustomerEntity(
            honrsic: "Mr.",
            firstName: "Joe",
            lastName: "A",
            accountType: AccountType.private,
            nickName: ""));
    expect(viewModel.helloString, "Mr. Joe A");
  });
  test('HelloCustomerViewModel initialize with error', () {
    try {
      HelloCustomerViewModel(customerEntity: null);
      expect(false, true);
    } catch (error) {
      expect(error != null, true);
    }
  });
}
