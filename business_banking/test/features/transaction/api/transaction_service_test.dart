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
              "transactionId": "0000000"
            },
          ]
        }));
  });
}
