import 'package:business_banking/features/transaction/api/transaction_details_service.dart';
import 'package:business_banking/features/transaction/bloc/transaction_details_usecase.dart';
import 'package:business_banking/features/transaction/model/transaction_details_view_model.dart';
import 'package:clean_framework/clean_framework.dart';

class TransactionDetailsBloc extends Bloc {
  TransactionDetailsUseCase _useCase;

  final transactionDetailsViewModelPipe = Pipe<TransactionDetailsViewModel>();

  @override
  void dispose() {
    transactionDetailsViewModelPipe.dispose();
  }

  TransactionDetailsBloc(
      {TransactionDetailsService transactionDetailsService}) {
    _useCase = TransactionDetailsUseCase(
        (viewModel) => transactionDetailsViewModelPipe.send(viewModel));
    transactionDetailsViewModelPipe.whenListenedDo(() => _useCase.create());
  }
}
