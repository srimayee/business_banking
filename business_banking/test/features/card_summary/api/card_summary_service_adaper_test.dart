import 'package:business_banking/features/card_usage/api/transaction_service_response_model_list.dart';
import 'package:business_banking/features/card_usage/bloc/card_summary_service_adapter.dart';
import 'package:business_banking/features/card_usage/model/card_summary_entity.dart';
import 'package:business_banking/features/card_usage/model/card_summary_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Entity is created by service adapter', () {
    final entity = CardSummaryServiceAdapter().createEntity(
        CardSummaryEntity(),
        TransactionServiceResponseModelList.fromJson({
          "cardTransactions": [
            {
              "debit": true,
              "transactionTitle": "Boots",
              "transactionCategory": "shopping",
              "transactionAmount": "9.99",
              "transactionId": "0000000",
              "payTo": "Merchant0",
              "timestamp": 1618237756
            },
          ]
        }));

    expect(
        entity,
        CardSummaryEntity(transactionDetails: [
          CardSummaryModel(
              debit: true,
              transactionAmount: 9.99,
              transactionTitle: 'Boots',
              transactionId: '0000000',
              transactionCategory: 'shopping',
              payTo: "Merchant0",
              date: DateTime.fromMillisecondsSinceEpoch(1618237756 * 1000))
        ]));
  });
}
