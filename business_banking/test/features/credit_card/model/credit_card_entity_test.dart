import 'package:business_banking/features/credit_card/model/credit_card_entity.dart';
import 'package:business_banking/features/credit_card/model/credit_card_view_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('CreditCardEntity initialize with null values', () async {
    final entity = CreditCardEntity();
    expect(entity.number, '');
    expect(entity.name, '');
    expect(entity.lastFour, '');
    expect(entity.balance, 0.00);
    expect(entity.paymentDueDate, DateTime.fromMicrosecondsSinceEpoch(0));
    expect(entity.nextClosingDate, DateTime.fromMicrosecondsSinceEpoch(0));
    expect(entity.paymentMinimumValue, 0.00);
    expect(entity.transactions, List<CreditCardTransaction>.empty(growable: false));
    expect(entity.props, [
      entity.errors,
      entity.number,
      entity.name,
      entity.lastFour,
      entity.balance,
      entity.paymentDueDate,
      entity.nextClosingDate,
      entity.paymentMinimumValue,
      entity.transactions,
    ]);
  });

  test('CreditCardEntity initialize with real values', () async {
    List<CreditCardTransaction> transactions = List.empty(growable: true);
    transactions.add(CreditCardTransaction(id: "1", name: "Transaction #1", date: DateTime.parse("2021-04-18"), value: 45.00));
    transactions.add(CreditCardTransaction(id: "2", name: "Transaction #2", date: DateTime.parse("2021-04-17"), value: 25.00));
    transactions.add(CreditCardTransaction(id: "3", name: "Transaction #3", date: DateTime.parse("2021-04-15"), value: 60.00));
    transactions.add(CreditCardTransaction(id: "4", name: "Transaction #4", date: DateTime.parse("2021-04-11"), value: 40.00));
    final entity = CreditCardEntity(
      number: '1111222233334444',
      name: 'My Credit Card',
      lastFour: '4444',
      balance: 1234.56,
      paymentDueDate: DateTime.parse("2021-05-03"),
      nextClosingDate: DateTime.parse("2021-05-06"),
      paymentMinimumValue: 100.00,
      transactions: transactions,
    );
    expect(entity.number, '1111222233334444');
    expect(entity.name, 'My Credit Card');
    expect(entity.lastFour, '4444');
    expect(entity.balance, 1234.56);
    expect(entity.paymentDueDate, DateTime.parse("2021-05-03"));
    expect(entity.nextClosingDate, DateTime.parse("2021-05-06"));
    expect(entity.paymentMinimumValue, 100.00);
    expect(entity.transactions, transactions);
    expect(entity.props, [
      entity.errors,
      entity.number,
      entity.name,
      entity.lastFour,
      entity.balance,
      entity.paymentDueDate,
      entity.nextClosingDate,
      entity.paymentMinimumValue,
      entity.transactions,
    ]);
  });

  test('CreditCardEntity merge', () async {
    List<CreditCardTransaction> transactions = List.empty(growable: true);
    transactions.add(CreditCardTransaction(id: "1", name: "Transaction #1", date: DateTime.parse("2021-04-18"), value: 45.00));
    transactions.add(CreditCardTransaction(id: "2", name: "Transaction #2", date: DateTime.parse("2021-04-17"), value: 25.00));
    transactions.add(CreditCardTransaction(id: "3", name: "Transaction #3", date: DateTime.parse("2021-04-15"), value: 60.00));
    transactions.add(CreditCardTransaction(id: "4", name: "Transaction #4", date: DateTime.parse("2021-04-11"), value: 40.00));
    final entity = CreditCardEntity(
      number: '1111222233334444',
      name: 'My Credit Card',
      lastFour: '4444',
      balance: 1234.56,
      paymentDueDate: DateTime.parse("2021-05-03"),
      nextClosingDate: DateTime.parse("2021-05-06"),
      paymentMinimumValue: 100.00,
      transactions: transactions,
    );


    List<CreditCardTransaction> transactions2 = List.empty(growable: true);
    transactions2.add(CreditCardTransaction(id: "6", name: "Transaction #6", date: DateTime.parse("2021-04-10"), value: 5.00));

    final entity2 = entity.merge(
        number: "5555666677778888",
        name: "Name2",
        lastFour: "8888",
        balance: 345.78,
        paymentDueDate: DateTime.parse("2022-01-01"),
        nextClosingDate: DateTime.parse("2022-01-03"),
        paymentMinimumValue: 5.67,
        transactions: transactions2
    ) as CreditCardEntity;

    expect(entity2.number, "5555666677778888");
    expect(entity2.name, "Name2");
    expect(entity2.lastFour, "8888");
    expect(entity2.balance, 345.78);
    expect(entity2.paymentDueDate, DateTime.parse("2022-01-01"));
    expect(entity2.nextClosingDate, DateTime.parse("2022-01-03"));
    expect(entity2.paymentMinimumValue, 5.67);
    expect(entity2.transactions, transactions2);


    final entity3 = entity2.merge() as CreditCardEntity;

    expect(entity2.number, entity3.number);
    expect(entity2.name, entity3.name);
    expect(entity2.lastFour, entity3.lastFour);
    expect(entity2.balance, entity3.balance);
    expect(entity2.paymentDueDate, entity3.paymentDueDate);
    expect(entity2.nextClosingDate, entity3.nextClosingDate);
    expect(entity2.paymentMinimumValue, entity3.paymentMinimumValue);
    expect(entity2.transactions, entity3.transactions);


  });

}
