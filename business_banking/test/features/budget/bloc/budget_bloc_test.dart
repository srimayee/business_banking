// @dart=2.9

import 'package:business_banking/features/budget/bloc/budget_bloc.dart';
import 'package:business_banking/features/budget/bloc/budget_card_usecase.dart';
import 'package:business_banking/features/budget/bloc/budget_chart_usecase.dart';
import 'package:business_banking/features/budget/model/account_info.dart';
import 'package:business_banking/features/budget/model/budget_view_model.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockBudgetCardUseCase extends Mock implements BudgetCardUseCase {}

class MockBudgetChartUseCase extends Mock implements BudgetChartUseCase {}

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
  });
}
