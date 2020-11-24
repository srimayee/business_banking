import 'package:business_banking/features/hello_customer/model/hello_customer_entity.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('HelloCustomerEntity properties', () {
    final entity = HelloCustomerEntity(
            honrsic: "Mr.",
            firstName: "Joe",
            lastName: "A",
            accountType: AccountType.private,
            nickName: "");
    expect(entity.honrsic, "Mr.");
    expect(entity.firstName, "Joe");
    expect(entity.lastName, "A");
    expect(entity.accountType, AccountType.private);
    expect(entity.nickName, "");

    expect(entity.toString(), "Mr. Joe A  AccountType.private");
  });

  test('HelloCustomerEntity merge with errors = null', () {
    final entity = HelloCustomerEntity(
            honrsic: "Mr.",
            firstName: "Joe",
            lastName: "A",
            accountType: AccountType.private,
            nickName: "");
    entity.merge(errors: null);
    expect(entity.honrsic, "Mr.");
    expect(entity.firstName, "Joe");
    expect(entity.lastName, "A");
    expect(entity.accountType, AccountType.private);
    expect(entity.nickName, "");
  });
}
