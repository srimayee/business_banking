import 'package:business_banking/features/customer/model/customer_entity.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('CustomerEntity properties', () {
    final entity = CustomerEntity(
        honorific: "Mr.",
        firstName: "Joe",
        lastName: "A",
        accountType: AccountType.private,
        nickName: "",
        address: "1234 ABCD Rd, City, State 00000");
    expect(entity.honorific, "Mr.");
    expect(entity.firstName, "Joe");
    expect(entity.lastName, "A");
    expect(entity.accountType, AccountType.private);
    expect(entity.nickName, "");
    expect(entity.address, "1234 ABCD Rd, City, State 00000");

    expect(
      entity.toString(),
      'CustomerEntity([], Mr., Joe, A, , AccountType.private, 1234 ABCD Rd, City, State 00000)',
    );
  });

  test('CustomerEntity merge with errors = null', () {
    final entity = CustomerEntity(
        honorific: "Mr.",
        firstName: "Joe",
        lastName: "A",
        accountType: AccountType.private,
        nickName: "",
        address: "1234 ABCD Rd, City, State 00000");
    entity.merge(errors: null);
    expect(entity.honorific, "Mr.");
    expect(entity.firstName, "Joe");
    expect(entity.lastName, "A");
    expect(entity.accountType, AccountType.private);
    expect(entity.nickName, "");
    expect(entity.address, "1234 ABCD Rd, City, State 00000");
  });
}
