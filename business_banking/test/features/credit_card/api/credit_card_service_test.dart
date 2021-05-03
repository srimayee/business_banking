import 'package:business_banking/features/credit_card/api/credit_card_service.dart';
import 'package:business_banking/features/credit_card/api/payment_response/credit_card_service_response_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('CreditCardService creation', () async {
    final service = CreditCardService();
    expect(service.path, 'credit-card');
  });

  test('CreditCardService parseResponse', () async {
    final json = {
      "number": '00001111',
      "name": 'AAAA',
      "lastFour": '1234',
      "balance": 100.00,
      "paymentDueDate": "2021-01-01",
      "nextClosingDate": "2021-01-02",
      "paymentMinimumValue": 20.00,
      "transactions": [
        {
          "id": "4",
          "name": "Transaction #4",
          "date": "2021-04-11",
          "value": 40.00
        }
      ]
    };
    final service = CreditCardService();
    CreditCardServiceResponseModel response = service.parseResponse(json);
    expect(response, isA<CreditCardServiceResponseModel>());
  });
}
