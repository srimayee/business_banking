import 'package:business_banking/features/card_usage/model/card_summary_model.dart';
import 'package:business_banking/features/card_usage/model/card_summary_view_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('TransactionViewModel initialize', () {
    final viewModel = CardSummaryViewModel(transactionDetails: [
      CardSummaryModel(
          debit: true,
          transactionAmount: 9.99,
          transactionTitle: 'Boots',
          transactionId: '0000000',
          transactionCategory: 'shopping',
          payTo: "Merchant0",
          date: DateTime.fromMillisecondsSinceEpoch(1618237756 * 1000))
    ]);

    expect(viewModel.props, [viewModel.transactionDetails]);
  });
  test('CustomerViewModel initialize with error', () {
    try {
      CardSummaryViewModel(transactionDetails: null);
      expect(false, true);
    } catch (error) {
      expect(error != null, true);
    }
  });
}
