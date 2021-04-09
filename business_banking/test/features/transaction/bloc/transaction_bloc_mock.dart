import 'package:business_banking/features/transaction/bloc/transaction_details_bloc.dart';
import 'package:business_banking/features/transaction/model/transaction_details_model.dart';
import 'package:business_banking/features/transaction/model/transaction_details_view_model.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:mockito/mockito.dart';

class TransactionBlocMock extends Fake implements TransactionDetailsBloc {
  Pipe<TransactionDetailsViewModel> transactionDetailsViewModelPipe =
      Pipe<TransactionDetailsViewModel>();

  TransactionBlocMock() {
    transactionDetailsViewModelPipe.whenListenedDo(() {
      transactionDetailsViewModelPipe
          .send(TransactionDetailsViewModel(transactionDetails: [
        TransactionDetailsModel(
          transactionAmount: '9.99',
          transactionTitle: 'Boots',
          transactionId: '0000000',
          transactionCategory: 'shopping',
        )
      ]));
    });
  }

  @override
  void dispose() {}
}
