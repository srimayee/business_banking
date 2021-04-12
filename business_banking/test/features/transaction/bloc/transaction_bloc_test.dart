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
        )
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
            transactionCategory: 'shopping'),
        TransactionModel(
            transactionAmount: '9.99',
            transactionTitle: 'Europe Tripe',
            transactionId: '0000001',
            transactionCategory: 'airTravel'),
        TransactionModel(
            transactionAmount: '9.99',
            transactionTitle: 'Cat in the Hat',
            transactionId: '0000002',
            transactionCategory: 'movies'),
        TransactionModel(
            transactionAmount: '9.99',
            transactionTitle: 'Olive Garden',
            transactionId: '0000003',
            transactionCategory: 'restaurant'),
        TransactionModel(
            transactionAmount: '50.99',
            transactionTitle: 'Starbucks',
            transactionId: '0000004',
            transactionCategory: 'coffeeShop'),
        TransactionModel(
            transactionAmount: '2000.23',
            transactionTitle: 'Paycheck',
            transactionId: '0000005',
            transactionCategory: 'income'),
        TransactionModel(
            transactionAmount: '200.23',
            transactionTitle: 'Gas Station',
            transactionId: '0000006',
            transactionCategory: 'gas'),
      ]);
    }));
  });
}
