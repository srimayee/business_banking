import 'package:business_banking/features/budget/api/transactions_service.dart';
import 'package:business_banking/features/budget/bloc/budget_card_usecase.dart';
import 'package:business_banking/features/budget/bloc/budget_chart_usecase.dart';
import 'package:business_banking/features/budget/model/budget_view_model.dart';
import 'package:clean_framework/clean_framework.dart';

class BudgetBloc extends Bloc {
  final budgetCardViewModelPipe = Pipe<BudgetViewModel>();
  final budgetChartViewModelPipe = Pipe<BudgetViewModel>();
  final chosenCategoryPipe = Pipe<String>();

  late BudgetChartUseCase _budgetChartUseCase;

  @override
  void dispose() {
    budgetCardViewModelPipe.dispose();
    budgetChartViewModelPipe.dispose();
    chosenCategoryPipe.dispose();
  }

  BudgetBloc({
    BudgetCardUseCase? budgetCardUseCase,
    BudgetChartUseCase? budgetChartUseCase,
  }) {
    budgetCardUseCase = budgetCardUseCase ??
        BudgetCardUseCase((viewModel) =>
            budgetCardViewModelPipe.send(viewModel as BudgetViewModel));
    budgetCardViewModelPipe.whenListenedDo(() => budgetCardUseCase!.create());

    budgetChartUseCase = budgetChartUseCase ??
        BudgetChartUseCase((viewModel) =>
            budgetChartViewModelPipe.send(viewModel as BudgetViewModel));
    budgetChartViewModelPipe.whenListenedDo(() => budgetChartUseCase!.create());
    _budgetChartUseCase = budgetChartUseCase;

    // filter event
    chosenCategoryPipe.receive.listen(_didApplyFilter);
  }

  void _didApplyFilter(String value) {
    _budgetChartUseCase.applyFilter(value);
  }
}
