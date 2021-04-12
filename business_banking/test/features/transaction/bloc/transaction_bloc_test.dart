import 'package:business_banking/features/transaction/bloc/transaction_bloc.dart';
import 'package:business_banking/features/transaction/model/transaction_model.dart';
import 'package:business_banking/features/transaction/model/transaction_view_model.dart';
import 'package:flutter_test/flutter_test.dart';

import 'transaction_bloc_mock.dart';

void main() {
  test('TransactionBloc gets view model, mock', () {
    final bloc = TransactionBlocMock();

    bloc.transactionDetailsViewModelPipe.receive.listen(expectAsync1((model) {
      expect(model, isA<TransactionViewModel>());
      expect(model.transactionDetails, [
        TransactionModel(
            transactionAmount: '9.99',
            transactionTitle: 'Boots',
            transactionId: '0000000',
            transactionCategory: 'shopping',
            payTo: "Merchant0",
            date: DateTime.fromMicrosecondsSinceEpoch(1618237756))
      ]);
    }));
  });

  test('TransactionBloc gets view model, real', () {
    final bloc = TransactionBloc();

    bloc.transactionDetailsViewModelPipe.receive.listen(expectAsync1((model) {
      expect(model, isA<TransactionViewModel>());
      expect(model.transactionDetails, [
        TransactionModel(
            transactionAmount: '9.99',
            transactionTitle: 'Boots',
            transactionId: '0000000',
            transactionCategory: 'shopping',
            payTo: "Merchant0",
            date: DateTime.fromMicrosecondsSinceEpoch(1618237756)),
        TransactionModel(
            transactionAmount: '9.99',
            transactionTitle: 'Europe Tripe',
            transactionId: '0000001',
            transactionCategory: 'airTravel',
            payTo: "Merchant1",
            date: DateTime.fromMicrosecondsSinceEpoch(1618237756)),
        TransactionModel(
            transactionAmount: '9.99',
            transactionTitle: 'Cat in the Hat',
            transactionId: '0000002',
            transactionCategory: 'movies',
            payTo: "Merchant2",
            date: DateTime.fromMicrosecondsSinceEpoch(1618237756)),
        TransactionModel(
            transactionAmount: '9.99',
            transactionTitle: 'Olive Garden',
            transactionId: '0000003',
            transactionCategory: 'restaurant',
            payTo: "Merchant3",
            date: DateTime.fromMicrosecondsSinceEpoch(1618237756)),
        TransactionModel(
            transactionAmount: '50.99',
            transactionTitle: 'Starbucks',
            transactionId: '0000004',
            transactionCategory: 'coffeeShop',
            payTo: "Merchant4",
            date: DateTime.fromMicrosecondsSinceEpoch(1618237756)),
        TransactionModel(
            transactionAmount: '2000.23',
            transactionTitle: 'Paycheck',
            transactionId: '0000005',
            transactionCategory: 'income',
            payTo: "Merchant5",
            date: DateTime.fromMicrosecondsSinceEpoch(1618237756)),
        TransactionModel(
            transactionAmount: '200.23',
            transactionTitle: 'Gas Station',
            transactionId: '0000006',
            transactionCategory: 'gas',
            payTo: "Merchant6",
            date: DateTime.fromMicrosecondsSinceEpoch(1618237756)),
      ]);
    }));
  });
}
