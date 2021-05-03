import 'package:business_banking/features/credit_card/model/payment_request/credit_card_payment_request_view_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('CreditCardPaymentRequestViewModel initialize', () async {
    final viewModel = CreditCardPaymentRequestViewModel(
      number: '1111222233334444',
      name: 'My Credit Card',
      lastFour: '4444',
      balance: 1234.56,
      paymentDueDate: DateTime.parse("2021-05-03"),
      nextClosingDate: DateTime.parse("2021-05-06"),
      paymentMinimumValue: 100.00,
      paymentValue: 20.00,
    );

    expect(viewModel.number, '1111222233334444');
    expect(viewModel.name, 'My Credit Card');
    expect(viewModel.lastFour, '4444');
    expect(viewModel.balance, 1234.56);
    expect(viewModel.paymentDueDate, DateTime.parse("2021-05-03"));
    expect(viewModel.nextClosingDate, DateTime.parse("2021-05-06"));
    expect(viewModel.paymentMinimumValue, 100.00);
    expect(viewModel.paymentValue, 20.00);
    expect(viewModel.props, [
      viewModel.number,
      viewModel.name,
      viewModel.lastFour,
      viewModel.balance,
      viewModel.paymentDueDate,
      viewModel.nextClosingDate,
      viewModel.paymentMinimumValue,
      viewModel.paymentValue,
    ]);
  });
}
