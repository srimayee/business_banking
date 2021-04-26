import 'package:business_banking/features/budget/api/transactions_service.dart';
import 'package:business_banking/features/budget/bloc/budget_usecase.dart';
import 'package:business_banking/features/budget/model/budget_view_model.dart';
import 'package:clean_framework/clean_framework.dart';

class BudgetBloc extends Bloc {
  late BudgetUsecase useCase;

  final budgetViewModelPipe = Pipe<BudgetViewModel>();
  final chosenCategoryPipe = Pipe<String>();

  @override
  void dispose() {
    budgetViewModelPipe.dispose();
  }

  BudgetBloc({TransactionsService? transactionsService}) {
    useCase = BudgetUsecase(
        (viewModel) => budgetViewModelPipe.send(viewModel as BudgetViewModel));
    budgetViewModelPipe.whenListenedDo(() => useCase.create());

    // filter event
    chosenCategoryPipe.receive.listen(_didApplyFilter);
  }

  void _didApplyFilter(String value) {
    useCase.applyFilter(value);
  }
}
