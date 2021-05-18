import 'package:business_banking/features/card_usage/api/transaction_service.dart';
import 'package:business_banking/features/card_usage/api/transaction_service_response_model_list.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('TransactionService success', () async {
    final service = TransactionService();
    final eitherResponse = await service.request();

    expect(eitherResponse.isRight, isTrue);
    expect(
        eitherResponse.fold((_) {}, (m) => m),
        TransactionServiceResponseModelList.fromJson({
          "cardTransactions": [
            {
              "transactionTitle": "Vacations Trip",
              "transactionCategory": "airTravel",
              "transactionAmount": "219.99",
              "transactionId": "0000001",
              "payTo": "Merchant1",
              "timestamp": 1619944222
            },
            {
              "transactionTitle": "Bahamas Cruise",
              "transactionCategory": "airTravel",
              "transactionAmount": "219.99",
              "transactionId": "0000101",
              "payTo": "Merchant1",
              "timestamp": 1619944222
            },
            {
              "transactionTitle": "Theater",
              "transactionCategory": "movies",
              "transactionAmount": "129.99",
              "transactionId": "0000002",
              "payTo": "Merchant2",
              "timestamp": 1619944220
            },
            {
              "transactionTitle": "Friday Dinner",
              "transactionCategory": "restaurant",
              "transactionAmount": "9.99",
              "transactionId": "0000003",
              "payTo": "Merchant3",
              "timestamp": 1619944220
            },
            {
              "transactionTitle": "Cappuccino",
              "transactionCategory": "coffeeShop",
              "transactionAmount": "50.99",
              "transactionId": "0000004",
              "payTo": "Merchant4",
              "timestamp": 1620030620
            },
            {
              "transactionTitle": "Gas",
              "transactionCategory": "gas",
              "transactionAmount": "200.23",
              "transactionId": "0000006",
              "payTo": "Merchant6",
              "timestamp": 1620117020
            },
            {
              "transactionTitle": "Shirt Store",
              "transactionCategory": "shopping",
              "transactionAmount": "400.23",
              "transactionId": "0000007",
              "payTo": "Merchant7",
              "timestamp": 1620203420
            },
            {
              "transactionTitle": "Harvard",
              "transactionCategory": "tuition",
              "transactionAmount": "300.00",
              "transactionId": "0000008",
              "payTo": "Merchant8",
              "timestamp": 1620203420
            },
            {
              "transactionTitle": "Bus",
              "transactionCategory": "transportation",
              "transactionAmount": "335.67",
              "transactionId": "00000009",
              "payTo": "Merchant9",
              "timestamp": 1620203420
            },
            {
              "transactionTitle": "Tennis Class",
              "transactionCategory": "miscellaneous",
              "transactionAmount": "50.67",
              "transactionId": "00000010",
              "payTo": "Merchant10",
              "timestamp": 1620289820
            },
            {
              "transactionTitle": "Barber Shop",
              "transactionCategory": "haircut",
              "transactionAmount": "50.67",
              "transactionId": "00000011",
              "payTo": "Merchant11",
              "timestamp": 1620289820
            },
            {
              "transactionTitle": "Internet Bill",
              "transactionCategory": "utilities",
              "transactionAmount": "50.00",
              "transactionId": "00000012",
              "payTo": "Merchant12",
              "timestamp": 1620289820
            },
            {
              "transactionTitle": "Gardener",
              "transactionCategory": "service",
              "transactionAmount": "120.00",
              "transactionId": "00000013",
              "payTo": "Merchant13",
              "timestamp": 1620376220
            },
            {
              "transactionTitle": "Veterans Donation",
              "transactionCategory": "charity",
              "transactionAmount": "100.00",
              "transactionId": "00000016",
              "payTo": "Merchant16",
              "timestamp": 1620462620
            },
            {
              "transactionTitle": "Physical Exam",
              "transactionCategory": "health",
              "transactionAmount": "200.00",
              "transactionId": "00000017",
              "payTo": "Merchant17",
              "timestamp": 1620462620
            },
            {
              "transactionTitle": "ATM Withdrawal",
              "transactionCategory": "withdrawals",
              "transactionAmount": "140.00",
              "transactionId": "00000018",
              "payTo": "Merchant18",
              "timestamp": 1620462620
            },
            {
              "transactionTitle": "Streaming Subscription",
              "transactionCategory": "subscriptions",
              "transactionAmount": "30.00",
              "transactionId": "00000019",
              "payTo": "Merchant19",
              "timestamp": 1620462620
            },
            {
              "transactionTitle": "Organic Groceries",
              "transactionCategory": "groceries",
              "transactionAmount": "30.00",
              "transactionId": "00000020",
              "payTo": "Merchant20",
              "timestamp": 1620462620
            }
          ]
        }));
  });
}
