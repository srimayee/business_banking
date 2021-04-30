import 'package:business_banking/features/credit_card/api/payment_response/credit_card_payment_response_service_request_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('CreditCardPaymentResponseServiceRequestModel initialize', () async {

    final viewModel = CreditCardPaymentResponseServiceRequestModel(
      number: '1111222233334444',
      paymentValue: 100.00,
    );

    expect(viewModel.number, '1111222233334444');
    expect(viewModel.paymentValue, 100.00);
    expect(viewModel.props, [
      viewModel.number,
      viewModel.paymentValue,
    ]);
  });

  test('CreditCardPaymentResponseServiceRequestModel toJson', () async {

    final viewModel = CreditCardPaymentResponseServiceRequestModel(
      number: '1111222233334444',
      paymentValue: 100.00,
    );

    expect(viewModel.toJson(), {"number": '1111222233334444', "paymentValue": 100.00});
  });


}
