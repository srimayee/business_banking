import 'package:business_banking/features/transaction/api/transaction_details_service_response_model_list.dart';
import 'package:business_banking/features/transaction/bloc/transaction_details_service_adapter.dart';
import 'package:business_banking/features/transaction/model/transaction_details_entity.dart';
import 'package:business_banking/features/transaction/model/transaction_details_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Entity is created by service adapter', () {
    final entity = TransactionDetailsServiceAdapter().createEntity(
        TransactionDetailsEntity(),
        TransactionDetailServiceResponseModelList.fromJson({
          "accountTransactions": [
            {
              "transactionTitle": "Boots",
              "transactionCategory": "shopping",
              "transactionAmount": "9.99",
              "transactionId": "0000000"
            },
          ]
        }));

    expect(
        entity,
        TransactionDetailsEntity(transactionDetails: [
          TransactionDetailsModel(
            transactionAmount: '9.99',
            transactionTitle: 'Boots',
            transactionId: '0000000',
            transactionCategory: 'shopping',
          )
        ]));
  });
}
