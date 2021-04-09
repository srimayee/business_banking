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
          transactionCategory: 'shopping',
        )
      ]);
    }));
  });
}
