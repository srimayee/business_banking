import 'package:business_banking/features/customer/model/customer_detail_view_model.dart';
import 'package:business_banking/features/customer/model/customer_entity.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('CustomerDetailViewModel initialize', () {
    final viewModel = CustomerDetailViewModel(
        customerEntity: CustomerEntity(
            honorific: "Mr.",
            firstName: "Joe",
            lastName: "A",
            address: "1234 ABCD Rd, City, State 00000"));
    expect(viewModel.honorific, "Mr.");
    expect(viewModel.name, "Joe A");
    expect(viewModel.address, "1234 ABCD Rd, City, State 00000");
  });
  test('CustomerDetailViewModel initialize with error', () {
    try {
      CustomerDetailViewModel(customerEntity: null);
      expect(false, true);
    } catch (error) {
      expect(error != null, true);
    }
  });
}
