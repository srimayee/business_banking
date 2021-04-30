import 'package:business_banking/features/credit_card/model/credit_card_view_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {

  test('CreditCardTransaction initialize', () async {
    final viewModel = CreditCardTransaction(id: "1", name: "Transaction #1", date: DateTime.parse("2021-04-18"), value: 45.00);
    expect(viewModel.id, '1');
    expect(viewModel.name, 'Transaction #1');
    expect(viewModel.date, DateTime.parse("2021-04-18"));
    expect(viewModel.value, 45.00);

    final viewModel2 = CreditCardTransaction.fromJson({"id": "4", "name": "Transaction #4", "date": "2021-04-11", "value": 40.00});
    expect(viewModel2.id, '4');
    expect(viewModel2.name, 'Transaction #4');
    expect(viewModel2.date, DateTime.parse("2021-04-11"));
    expect(viewModel2.value, 40.00);
  });


  test('CreditCardViewModel initialize', () async {
    List<CreditCardTransaction> transactions = List.empty(growable: true);
    transactions.add(CreditCardTransaction(id: "1", name: "Transaction #1", date: DateTime.parse("2021-04-18"), value: 45.00));
    transactions.add(CreditCardTransaction(id: "2", name: "Transaction #2", date: DateTime.parse("2021-04-17"), value: 25.00));
    transactions.add(CreditCardTransaction(id: "3", name: "Transaction #3", date: DateTime.parse("2021-04-15"), value: 60.00));
    transactions.add(CreditCardTransaction.fromJson({"id": "4", "name": "Transaction #4", "date": "2021-04-11", "value": 40.00}));
    final viewModel = CreditCardViewModel(
      number: '1111222233334444',
      name: 'My Credit Card',
      lastFour: '4444',
      balance: 1234.56,
      paymentDueDate: DateTime.parse("2021-05-03"),
      nextClosingDate: DateTime.parse("2021-05-06"),
      paymentMinimumValue: 100.00,
      transactions: transactions,
    );
    expect(viewModel.number, '1111222233334444');
    expect(viewModel.name, 'My Credit Card');
    expect(viewModel.lastFour, '4444');
    expect(viewModel.balance, 1234.56);
    expect(viewModel.paymentDueDate, DateTime.parse("2021-05-03"));
    expect(viewModel.nextClosingDate, DateTime.parse("2021-05-06"));
    expect(viewModel.paymentMinimumValue, 100.00);
    expect(viewModel.transactions, transactions);
    expect(viewModel.props, [
      viewModel.number,
      viewModel.name,
      viewModel.lastFour,
      viewModel.balance,
      viewModel.paymentDueDate,
      viewModel.nextClosingDate,
      viewModel.paymentMinimumValue,
      viewModel.transactions,
    ]);
  });

}
