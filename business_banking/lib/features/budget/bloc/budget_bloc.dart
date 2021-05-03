import 'package:business_banking/features/budget/bloc/accounts_card_usecase.dart';
import 'package:business_banking/features/budget/bloc/transactions_usecase.dart';
import 'package:business_banking/features/budget/model/budget_view_model.dart';
import 'package:clean_framework/clean_framework.dart';

import '../ui/budget_feature_events.dart';

class BudgetBloc extends Bloc {
  final budgetCardViewModelPipe = Pipe<BudgetViewModel>();
  final budgetChartViewModelPipe = Pipe<BudgetViewModel>();
  final budgetEvent = Pipe<BudgetEvent>();

  late AccountsCardUseCase _budgetCardUseCase;
  late TransactionsUseCase _budgetChartUseCase;

  @override
  void dispose() {
    budgetCardViewModelPipe.dispose();
    budgetChartViewModelPipe.dispose();
    budgetEvent.dispose();
  }

  BudgetBloc({
    AccountsCardUseCase? budgetCardUseCase,
    TransactionsUseCase? budgetChartUseCase,
  }) {
    budgetCardUseCase = budgetCardUseCase ??
        AccountsCardUseCase((viewModel) =>
            budgetCardViewModelPipe.send(viewModel as BudgetViewModel));
    budgetCardViewModelPipe.whenListenedDo(() => budgetCardUseCase!.create());
    _budgetCardUseCase = budgetCardUseCase;

    budgetChartUseCase = budgetChartUseCase ??
        TransactionsUseCase((viewModel) =>
            budgetChartViewModelPipe.send(viewModel as BudgetViewModel));
    budgetChartViewModelPipe.whenListenedDo(() => budgetChartUseCase!.create());
    _budgetChartUseCase = budgetChartUseCase;

    // filter event
    budgetEvent.receive.listen(budgetEventHandler);
  }

  void budgetEventHandler(BudgetEvent eventType) {
    if (eventType is ApplyFilter) {
      _budgetChartUseCase.applyFilter(eventType.value);
    } else if (eventType is SelectAccount) {
      _budgetCardUseCase.selectedAccountWithRowIndex(eventType.value);
    }
  }
}
