import 'package:business_banking/features/account_detail/model/account_detail_entity.dart';
import 'package:test/test.dart';

void main() {
  test('AccountDetailEntity properties', () {
    final entity = AccountDetailEntity(
      name: 'Employee Checking',
      lastFour: '6543',
      accountType: 'Employee Checking',
      routingNumber: 746395735,
      balance: 3545.54,
      beginningBalance: 3674.43,
      pendingTransactions: -128.89,
      depositHolds: 0.00,
    );

    expect(entity.name, 'Employee Checking');
    expect(entity.lastFour, '6543');
    expect(entity.accountType, 'Employee Checking');
    expect(entity.routingNumber, 746395735);
    expect(entity.balance, 3545.54);
    expect(entity.beginningBalance, 3674.43);
    expect(entity.pendingTransactions, -128.89);
    expect(entity.depositHolds, 0.00);
    expect(
      entity.toString(),
      'AccountDetailEntity([], Employee Checking, 6543, Employee Checking, 746395735, 3545.54, 3674.43, -128.89, 0.0)',
    );
  });

  test('AccountDetailEntity merge with null errors', () {
    final entity = AccountDetailEntity(
      errors: [],
      name: 'Employee Checking',
      lastFour: '6543',
      accountType: 'Employee Checking',
      routingNumber: 746395735,
      balance: 3545.54,
      beginningBalance: 3674.43,
      pendingTransactions: -128.89,
      depositHolds: 0.00,
    );
    final merged = entity.merge(errors: null);
    expect(merged.errors, []);
    expect(merged.name, 'Employee Checking');
    expect(merged.lastFour, '6543');
    expect(merged.accountType, 'Employee Checking');
    expect(merged.routingNumber, 746395735);
    expect(merged.balance, 3545.54);
    expect(merged.beginningBalance, 3674.43);
    expect(merged.pendingTransactions, -128.89);
    expect(merged.depositHolds, 0.00);
    expect(
      merged.toString(),
      'AccountDetailEntity([], Employee Checking, 6543, Employee Checking, 746395735, 3545.54, 3674.43, -128.89, 0.0)',
    );
  });
}
