// @dart=2.9

import 'package:business_banking/features/budget/bloc/accounts_card_usecase.dart';
import 'package:business_banking/features/budget/bloc/budget_bloc.dart';
import 'package:business_banking/features/budget/bloc/transactions_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockBudgetCardUseCase extends Mock implements AccountsCardUseCase {}

class MockBudgetChartUseCase extends Mock implements TransactionsUseCase {}

main() {
  BudgetBloc bloc;
  MockBudgetCardUseCase mockBudgetCardUseCase;
  MockBudgetChartUseCase mockBudgetChartUseCase;
  setUp(() {
    mockBudgetCardUseCase = MockBudgetCardUseCase();
    mockBudgetChartUseCase = MockBudgetChartUseCase();
    bloc = BudgetBloc(
        budgetCardUseCase: mockBudgetCardUseCase,
        budgetChartUseCase: mockBudgetChartUseCase);
  });

  tearDown(() {
    bloc.dispose();
  });

  group('', () {
    test('budgetCardViewModelPipe streams out BudgetViewModel to listeners.',
        () {
      bloc.budgetCardViewModelPipe.receive.listen((model) {
        verify(mockBudgetCardUseCase.create()).called(1);
      });
    });

    test('budgetChartViewModelPipe streams out BudgetViewModel to listeners.',
        () {
      bloc.budgetChartViewModelPipe.receive.listen((model) {
        verify(mockBudgetCardUseCase.create()).called(1);
      });
    });

    test('chosenCategoryPipe streams out BudgetViewModel to listeners.', () {
      bloc.chosenCategoryPipe.send('gas');
      bloc.budgetChartViewModelPipe.receive.listen((model) {
        verify(mockBudgetCardUseCase.create()).called(1);
      });
    });

    test('selectedRowIndexPipe streams out BudgetViewModel to listeners.', () {
      bloc.selectedRowIndexPipe.send(1);
      bloc.budgetChartViewModelPipe.receive.listen((model) {
        verify(mockBudgetCardUseCase.create()).called(1);
      });
    });
  });
}
