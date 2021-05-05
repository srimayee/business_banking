import 'dart:typed_data';

import 'package:business_banking/features/budget/bloc/accounts_card_usecase.dart';
import 'package:business_banking/features/budget/bloc/transactions_usecase.dart';
import 'package:business_banking/features/budget/model/budget_view_model.dart';
import 'package:clean_framework/clean_framework.dart';

class BudgetBloc extends Bloc {
  final budgetCardViewModelPipe = Pipe<BudgetViewModel>();
  final budgetChartViewModelPipe = Pipe<BudgetViewModel>();
  final chosenCategoryPipe = Pipe<String>();
  final selectedRowIndexPipe = Pipe<int>();
  final chartPipe = Pipe<Uint8List>();

  late AccountsCardUseCase _budgetCardUseCase;
  late TransactionsUseCase _budgetChartUseCase;

  @override
  void dispose() {
    budgetCardViewModelPipe.dispose();
    budgetChartViewModelPipe.dispose();
    chosenCategoryPipe.dispose();
    selectedRowIndexPipe.dispose();
    chartPipe.dispose();
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
    chosenCategoryPipe.receive.listen(_didApplyFilter);

    // account selection event
    selectedRowIndexPipe.receive.listen(didSelectRowAtIndex);

    chartPipe.receive.listen(shareChart);
  }

  void _didApplyFilter(String value) {
    _budgetChartUseCase.applyFilter(value);
  }

  void didSelectRowAtIndex(int index) {
    _budgetCardUseCase.selectedAccountWithRowIndex(index);
  }

  Future<String> shareChart(Uint8List data) async {
    return _budgetChartUseCase.pngChartImagePath(data);
  }
}
