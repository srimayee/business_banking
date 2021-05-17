import 'package:business_banking/features/card_usage/api/transaction_service.dart';
import 'package:business_banking/features/card_usage/model/card_summary_view_model.dart';
import 'package:clean_framework/clean_framework.dart';

import 'card_summary_usecase.dart';

class CardSummaryBloc extends Bloc {
  CardSummaryUseCase _useCase;

  final transactionDetailsViewModelPipe = Pipe<CardSummaryViewModel>();

  @override
  void dispose() {
    transactionDetailsViewModelPipe.dispose();
  }

  CardSummaryBloc({TransactionService transactionDetailsService}) {
    _useCase = CardSummaryUseCase(
        (viewModel) => transactionDetailsViewModelPipe.send(viewModel));
    transactionDetailsViewModelPipe.whenListenedDo(() => _useCase.create());
  }
}
