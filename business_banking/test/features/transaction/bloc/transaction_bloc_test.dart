import 'package:business_banking/features/cash_accounts/bloc/cash_accounts_bloc.dart';
import 'package:business_banking/features/cash_accounts/model/cash_accounts_view_model.dart';
import 'package:business_banking/features/transaction/bloc/transaction_details_bloc.dart';
import 'package:business_banking/features/transaction/model/transaction_details_model.dart';
import 'package:business_banking/features/transaction/model/transaction_details_view_model.dart';
import 'package:flutter_test/flutter_test.dart';

import 'transaction_bloc_mock.dart';

void main() {
  test('TransactionBloc gets view model, mock', () {
    final bloc = TransactionBlocMock();

    bloc.transactionDetailsViewModelPipe.receive.listen(expectAsync1((model) {
      expect(model, isA<TransactionDetailsViewModel>());
      expect(model.transactionDetails, [
        TransactionDetailsModel(
          transactionAmount: '9.99',
          transactionTitle: 'Boots',
          transactionId: '0000000',
          transactionCategory: 'shopping',
        )
      ]);
    }));
  });

  test('TransactionBloc gets view model, real', () {
    final bloc = TransactionDetailsBloc();

    bloc.transactionDetailsViewModelPipe.receive.listen(expectAsync1((model) {
      expect(model, isA<TransactionDetailsViewModel>());
      expect(model.transactionDetails, [
        TransactionDetailsModel(
          transactionAmount: '9.99',
          transactionTitle: 'Boots',
          transactionId: '0000000',
          transactionCategory: 'shopping',
        )
      ]);
    }));
  });
}
