import 'package:business_banking/features/hello_customer_detail/model/hello_customer_detail_view_model.dart';
import 'package:flutter_test/flutter_test.dart';

const NAME = "Joe";
const DATETIME = "10/20/2020 13:00";

void main() {
  test('HelloCustomerDetailViewModel initialize', () {
    final entity = HelloCustomerDetailViewModel(name: NAME, currentTimeString: DATETIME);
    expect(entity.name, NAME);
    expect(entity.currentTimeString, DATETIME);
  });
  test('HelloCustomerDetailViewModel initialize with error', () {
    try {
      HelloCustomerDetailViewModel(name: null, currentTimeString: null);
      expect(false, true);
    } catch(error) {
      expect(error != null, true);
    }
  });
}
