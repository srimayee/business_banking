import 'package:business_banking/features/cash_accounts/api/cash_accounts_service_response_model.dart';
import 'package:business_banking/features/credit_card/api/credit_card_service.dart';
import 'package:business_banking/features/credit_card/api/payment_response/credit_card_service_response_model.dart';
import 'package:business_banking/features/credit_card/api/payment_response/credit_card_payment_response_service.dart';
import 'package:business_banking/features/credit_card/api/payment_response/credit_card_payment_response_service_response_model.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('CreditCardPaymentService creation', () async {
    final service = CreditCardPaymentService();
    expect(service.path, 'credit-card-payment');
    // expect(service.method, RestMethod.get);
  });

  test('CreditCardPaymentService parseResponse', () async {

    final json = {
      "number": '00001111',
      "name": 'AAAA',
      "lastFour": '1234',
      "paymentValue": 100.00,
      "paymentStatus": "Rejected",
      "nextClosingDate": "Insufficient Funds.",
    };

    final service = CreditCardPaymentService();

    CreditCardPaymentResponseServiceResponseModel response = service.parseResponse(json);

    expect(response, CreditCardPaymentResponseServiceResponseModel.fromJson(json));
  });

}
