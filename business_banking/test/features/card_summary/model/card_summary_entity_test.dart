import 'package:business_banking/features/card_usage/model/card_summary_entity.dart';
import 'package:business_banking/features/card_usage/model/card_summary_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('TransactionEntity properties', () {
    final entity = CardSummaryEntity(transactionDetails: [
      CardSummaryModel(
          debit: true,
          transactionAmount: 9.99,
          transactionTitle: 'Boots',
          transactionId: '0000000',
          transactionCategory: 'shopping',
          payTo: "Merchant0",
          date: DateTime.fromMillisecondsSinceEpoch(1618223356 * 1000))
    ]);
    expect(entity.transactionDetails.first.transactionTitle, "Boots");
    expect(entity.transactionDetails.first.transactionId, "0000000");
    expect(entity.transactionDetails.first.transactionCategory, "shopping");
    expect(entity.transactionDetails.first.payTo, "Merchant0");
    expect(entity.transactionDetails.first.date,
        DateTime.fromMillisecondsSinceEpoch(1618223356 * 1000));

    expect(
      entity.toString(),
      'CardSummaryEntity([], [CardSummaryModel(Boots, shopping, 9.99, 0000000, Merchant0, 2021-04-12 03:29:16.000, true)])',
    );
  });

  test('CustomerEntity merge with errors = null', () {
    final entity = CardSummaryEntity(transactionDetails: [
      CardSummaryModel(
          debit: true,
          transactionAmount: 9.99,
          transactionTitle: 'Boots',
          transactionId: '0000000',
          transactionCategory: 'shopping',
          payTo: "Merchant0",
          date: DateTime.fromMillisecondsSinceEpoch(1618223356 * 1000))
    ]);
    entity.merge(errors: null);
    expect(entity.transactionDetails.first.transactionTitle, "Boots");
    expect(entity.transactionDetails.first.transactionId, "0000000");
    expect(entity.transactionDetails.first.transactionCategory, "shopping");
    expect(entity.transactionDetails.first.payTo, "Merchant0");
    expect(entity.transactionDetails.first.date,
        DateTime.fromMillisecondsSinceEpoch(1618223356 * 1000));
  });
}
