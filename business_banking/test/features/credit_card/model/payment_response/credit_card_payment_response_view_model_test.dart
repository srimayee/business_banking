import 'package:business_banking/features/credit_card/model/payment_request/credit_card_payment_request_view_model.dart';
import 'package:business_banking/features/credit_card/model/payment_response/credit_card_payment_response_view_model.dart';
import 'package:business_banking/features/credit_card/model/credit_card_view_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('CreditCardPaymentResponseViewModel initialize', () async {

    final viewModel = CreditCardPaymentResponseViewModel(
      number: '1111222233334444',
      name: 'My Credit Card',
      lastFour: '4444',
      paymentValue: 0.00,
      paymentStatus: 'Rejected',
      reasonRejected: 'Rejected!'
    );

    expect(viewModel.number, '1111222233334444');
    expect(viewModel.name, 'My Credit Card');
    expect(viewModel.lastFour, '4444');
    expect(viewModel.paymentValue, 0.00);
    expect(viewModel.paymentStatus, 'Rejected');
    expect(viewModel.reasonRejected, 'Rejected!');
    expect(viewModel.props, [
      viewModel.number,
      viewModel.name,
      viewModel.lastFour,
      viewModel.paymentValue,
      viewModel.paymentStatus,
      viewModel.reasonRejected
    ]);
  });
}
