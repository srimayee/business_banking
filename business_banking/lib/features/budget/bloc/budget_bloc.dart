import 'package:business_banking/features/budget/api/transactions_service.dart';
import 'package:business_banking/features/budget/bloc/budget_usecase.dart';
import 'package:business_banking/features/budget/bloc/list_transactions_usecase.dart';
import 'package:business_banking/features/budget/model/budget_view_model.dart';
import 'package:business_banking/features/budget/model/list_transactions_view_model.dart';
import 'package:clean_framework/clean_framework.dart';

class BudgetBloc extends Bloc {
  late BudgetUsecase useCase;
  late ListTransactionsUseCase listTransactionsUseCase;

  final budgetViewModelPipe = Pipe<BudgetViewModel>();
  final listTransactionsViewModelPipe = Pipe<ListTransactionsViewModel>();
  final chosenCategoryPipe = Pipe<String>();

  @override
  void dispose() {
    budgetViewModelPipe.dispose();
    listTransactionsViewModelPipe.dispose();
  }

  BudgetBloc({TransactionsService? transactionsService}) {
    useCase = BudgetUsecase(
        (viewModel) => budgetViewModelPipe.send(viewModel as BudgetViewModel));
    budgetViewModelPipe.whenListenedDo(() => useCase.create());

    listTransactionsUseCase = ListTransactionsUseCase((viewModel) =>
        listTransactionsViewModelPipe
            .send(viewModel as ListTransactionsViewModel));
    listTransactionsViewModelPipe
        .whenListenedDo(() => listTransactionsUseCase.create());

    chosenCategoryPipe.receive.listen(_didApplyFilter);
  }

  void _didApplyFilter(String value) {
    listTransactionsUseCase.applyFilter(value);
  }
}
