import 'package:business_banking/features/hello_customer_detail/model/hello_customer_detail_entity.dart';
import 'package:flutter_test/flutter_test.dart';

const NAME = "Joe";
const DATETIME = "10/20/2020 13:00";

void main() {
  test('HelloCustomerDetailEntity properties', () {
    final entity = HelloCustomerDetailEntity(name: NAME, currentTimeString: DATETIME);
    expect(entity.name, NAME);
    expect(entity.currentTimeString, DATETIME);
    expect(entity.toString(), "$NAME $DATETIME");
  });

  test('HelloCustomerDetailEntity merge with errors = null', () {
    final entity = HelloCustomerDetailEntity(name: NAME, currentTimeString: DATETIME);
    entity.merge(errors: null);
    expect(entity.name, NAME);
    expect(entity.currentTimeString, DATETIME);
    expect(entity.toString(), "$NAME $DATETIME");
  });
}
