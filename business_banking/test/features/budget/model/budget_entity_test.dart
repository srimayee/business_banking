// @dart=2.9

import 'package:business_banking/features/budget/model/account_info.dart';
import 'package:business_banking/features/budget/model/budget_entity.dart';
import 'package:business_banking/features/budget/model/posted_transactions.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  PostedTransactions _postedTxns;
  BudgetEntity entity;

  setUp(() {
    //dummy data
    _postedTxns = PostedTransactions('2021-04-04T19:00:03Z',
        'SUNRISE MINI MART', 2.00, 'Wholesale Clubs', 'xxxx-xxxx-xxxx-6917');

    entity = BudgetEntity(
        accountInfo: AccountInfo('1234567890', 1.00, 'Account Nickname'),
        allTransactions: [_postedTxns]);
  });

  tearDown(() {
    entity = null;
  });

  test('initializing BudgetEntity', () async {
    expect(entity.props, [
      entity.errors,
      entity.accountInfo,
      entity.allTransactions,
      entity.chartData
    ]);

    //testing attributes
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

  test('Failed initializing BudgetEntity!', () async {
    expect(entity.props, [
      entity.errors,
      entity.accountInfo,
      entity.allTransactions,
      entity.chartData
    ]);

    //testing merge method
    final merged = entity.merge(errors: [GeneralEntityFailure()]);
    expect(merged.hasErrors(), true);
    expect(merged.errors.first, isA<GeneralEntityFailure>());
  });
}
