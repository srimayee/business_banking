import 'package:business_banking/features/budget/api/transactions_service.dart';
import 'package:business_banking/features/budget/bloc/budget_usecase.dart';
import 'package:business_banking/features/budget/model/budget_view_model.dart';
import 'package:clean_framework/clean_framework.dart';

class BudgetBloc extends Bloc {
  BudgetUsecase _useCase;

  final budgetViewModelPipe = Pipe<BudgetViewModel>();

  @override
  void dispose() {
    budgetViewModelPipe.dispose();
  }

  BudgetBloc({TransactionsService transactionsService}) {
    _useCase =
        BudgetUsecase((viewModel) => budgetViewModelPipe.send(viewModel));
    budgetViewModelPipe.whenListenedDo(() => _useCase.create());
  }
}
