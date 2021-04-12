import 'package:business_banking/features/transaction/api/transaction_service.dart';
import 'package:business_banking/features/transaction/api/transaction_service_response_model_list.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('TransactionService success', () async {
    final service = TransactionService();
    final eitherResponse = await service.request();

    expect(eitherResponse.isRight, isTrue);
    expect(
        eitherResponse.fold((_) {}, (m) => m),
        TransactionServiceResponseModelList.fromJson({
          "accountTransactions": [
            {
              "transactionTitle": "Boots",
              "transactionCategory": "shopping",
              "transactionAmount": "9.99",
              "transactionId": "0000000",
              "payTo": "Merchant0",
              "timestamp": 1618237756
            },
            {
              "transactionTitle": "Europe Tripe",
              "transactionCategory": "airTravel",
              "transactionAmount": "9.99",
              "transactionId": "0000001",
              "payTo": "Merchant1",
              "timestamp": 1618237756
            },
            {
              "transactionTitle": "Cat in the Hat",
              "transactionCategory": "movies",
              "transactionAmount": "9.99",
              "transactionId": "0000002",
              "payTo": "Merchant2",
              "timestamp": 1618237756
            },
            {
              "transactionTitle": "Olive Garden",
              "transactionCategory": "restaurant",
              "transactionAmount": "9.99",
              "transactionId": "0000003",
              "payTo": "Merchant3",
              "timestamp": 1618237756
            },
            {
              "transactionTitle": "Starbucks",
              "transactionCategory": "coffeeShop",
              "transactionAmount": "50.99",
              "transactionId": "0000004",
              "payTo": "Merchant4",
              "timestamp": 1618237756
            },
            {
              "transactionTitle": "Paycheck",
              "transactionCategory": "income",
              "transactionAmount": "2000.23",
              "transactionId": "0000005",
              "payTo": "Merchant5",
              "timestamp": 1618237756
            },
            {
              "transactionTitle": "Gas Station",
              "transactionCategory": "gas",
              "transactionAmount": "200.23",
              "transactionId": "0000006",
              "payTo": "Merchant6",
              "timestamp": 1618237756
            }
          ]
        }));
  });
}
