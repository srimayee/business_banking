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
}
