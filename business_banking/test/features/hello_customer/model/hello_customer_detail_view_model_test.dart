import 'package:business_banking/features/hello_customer/model/hello_customer_detail_view_model.dart';
import 'package:business_banking/features/hello_customer/model/hello_customer_detail_entity.dart';
import 'package:business_banking/features/hello_customer/model/hello_customer_entity.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('HelloCustomerDetailViewModel initialize', () {
    final viewModel = HelloCustomerDetailViewModel(
        customerDetailEntity: HelloCustomerDetailEntity(
            customerEntity: HelloCustomerEntity(
                honrsic: "Mr.", firstName: "Joe", lastName: "A"),
            weather: "sunny",
            address: "1234 ABCD Rd, City, State 00000"));
    expect(viewModel.honrsic, "Mr.");
    expect(viewModel.name, "Joe A");
    expect(viewModel.weather, "sunny");
    expect(viewModel.address, "1234 ABCD Rd, City, State 00000");
  });
  test('HelloCustomerDetailViewModel initialize with error', () {
    try {
      HelloCustomerDetailViewModel(customerDetailEntity: null);
      expect(false, true);
    } catch (error) {
      expect(error != null, true);
    }
  });
}
