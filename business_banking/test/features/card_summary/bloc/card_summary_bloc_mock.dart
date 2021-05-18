import 'package:business_banking/features/card_usage/bloc/card_summary_bloc.dart';
import 'package:business_banking/features/card_usage/model/card_summary_model.dart';
import 'package:business_banking/features/card_usage/model/card_summary_view_model.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:mockito/mockito.dart';

class TransactionBlocMock extends Fake implements CardSummaryBloc {
  Pipe<CardSummaryViewModel> transactionDetailsViewModelPipe =
      Pipe<CardSummaryViewModel>();

  TransactionBlocMock() {
    transactionDetailsViewModelPipe.whenListenedDo(() {
      transactionDetailsViewModelPipe
          .send(CardSummaryViewModel(cardTransactions: [
        CardSummaryModel(
            debit: true,
            transactionAmount: 9.99,
            transactionTitle: 'Boots',
            transactionId: '0000000',
            transactionCategory: 'shopping',
            payTo: "Merchant0",
            date: DateTime.fromMillisecondsSinceEpoch(1618237756 * 1000))
      ]));
    });
  }

  @override
  void dispose() {}
}
