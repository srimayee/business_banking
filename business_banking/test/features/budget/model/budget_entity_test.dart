// @dart=2.9

import 'package:business_banking/features/budget/model/account_info.dart';
import 'package:business_banking/features/budget/model/budget_entity.dart';
import 'package:business_banking/features/budget/model/posted_transactions.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('BudgetViewModel gets initialized', () async {
    final _postedTxns = PostedTransactions('2021-04-04T19:00:03Z',
        'SUNRISE MINI MART', 2.00, 'Wholesale Clubs', 'xxxx-xxxx-xxxx-6917');

    final entity = BudgetEntity(
        accountInfo: AccountInfo('1234567890', 1.00, 'Account Nickname'),
        allTransactions: [_postedTxns]);

    expect(entity.props, [
      entity.errors,
      entity.accountInfo,
      entity.allTransactions,
      entity.chartData
    ]);
    expect(entity.stringify, true);
    expect(entity.accountInfo?.accountNickname, 'Account Nickname');
    expect(entity.accountInfo?.availableBalance, 1.0);
    expect(entity.accountInfo?.accountNumber, '1234567890');

    expect(
        entity.allTransactions?.first?.transactionDate, '2021-04-04T19:00:03Z');
    expect(entity.allTransactions?.first?.description, 'SUNRISE MINI MART');
    expect(entity.allTransactions?.first?.debitAmount, 2.0);
    expect(entity.allTransactions?.first?.category, 'Wholesale Clubs');
    expect(entity.allTransactions?.first?.cardNumber, 'xxxx-xxxx-xxxx-6917');
    final merged = entity.merge(errors: null);
    expect(merged.errors, []);
    expect(
        entity.filterWith('Wholesale Clubs'), isA<List<PostedTransactions>>());
  });

  test('ENTITY TEST: On Success NewsEntity should be merged with error', () async {
    final _postedTxns = PostedTransactions('2021-04-04T19:00:03Z',
        'SUNRISE MINI MART', 2.00, 'Wholesale Clubs', 'xxxx-xxxx-xxxx-6917');

    final entity = BudgetEntity(
        accountInfo: AccountInfo('1234567890', 1.00, 'Account Nickname'),
        allTransactions: [_postedTxns]);

    expect(entity.props, [
      entity.errors,
      entity.accountInfo,
      entity.allTransactions,
      entity.chartData
    ]);

    final merged = entity.merge(errors: [GeneralEntityFailure()]);
    expect(merged.hasErrors(), true);
    expect(merged.errors.first, isA<GeneralEntityFailure>());
  });
}
