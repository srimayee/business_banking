import 'package:business_banking/features/credit_card/api/payment_response/credit_card_service_response_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('CreditCardPaymentResponseServiceRequestModel initialize', () async {

    final viewModel = CreditCardServiceResponseModel.fromJson({
      'number': '111111',
      'name': 'NAME',
      'lastFour': '4444',
      'balance': 100.00,
      'paymentDueDate': '2021-05-01',
      'nextClosingDate': '2021-05-02',
      'paymentMinimumValue': 50.00,
      'transactions': [{"id": "4", "name": "Transaction #4", "date": "2021-04-11", "value": 40.00}]
    });

    expect(viewModel.number, '111111');
    expect(viewModel.name, 'NAME');
    expect(viewModel.lastFour, '4444');
    expect(viewModel.balance, 100.00);
    expect(viewModel.paymentDueDate, DateTime.parse('2021-05-01'));
    expect(viewModel.nextClosingDate, DateTime.parse('2021-05-02'));
    expect(viewModel.paymentMinimumValue, 50.00);
    expect(viewModel.transactions.length, 1);
    expect(viewModel.transactions[0].id, '4');
    expect(viewModel.props, [
      viewModel.number,
      viewModel.name,
      viewModel.lastFour,
      viewModel.balance,
      viewModel.paymentDueDate,
      viewModel.nextClosingDate,
      viewModel.paymentMinimumValue,
      viewModel.transactions.length]);
  });


}
