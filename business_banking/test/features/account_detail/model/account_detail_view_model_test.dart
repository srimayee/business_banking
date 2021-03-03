import 'package:business_banking/features/account_detail/model/account_detail_view_model.dart';
import 'package:test/test.dart';

void main() {
  test('AccountDetailViewModel initialize', () async {
    final viewModel = AccountDetailViewModel(
      name: 'Employee Checking',
      lastFour: '6543',
      accountType: 'Employee Checking',
      routingNumber: 746395735,
      balance: 3545.54,
      beginningBalance: 3674.43,
      pendingTransactions: -128.89,
      depositHolds: 0.00,
    );

    expect(viewModel.name, 'Employee Checking');
    expect(viewModel.lastFour, '6543');
    expect(viewModel.accountType, 'Employee Checking');
    expect(viewModel.routingNumber, 746395735);
    expect(viewModel.balance, 3545.54);
    expect(viewModel.beginningBalance, 3674.43);
    expect(viewModel.pendingTransactions, -128.89);
    expect(viewModel.depositHolds, 0.00);
  });

  test('AccountDetailViewModel initialize with error', () async {
    try {
      AccountDetailViewModel(
        name: null,
        lastFour: '6543',
        accountType: 'Employee Checking',
        routingNumber: 746395735,
        balance: 3545.54,
        beginningBalance: 3674.43,
        pendingTransactions: -128.89,
        depositHolds: 0.00,
      );
    } catch (error) {
      expect(error != null, true);
    }
  });
}
