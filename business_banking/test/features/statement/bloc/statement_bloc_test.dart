// @dart=2.9
import 'package:business_banking/features/statement/bloc/hub_cards/statement_cards_use_case.dart';
import 'package:business_banking/features/statement/bloc/statement/statement_usecase.dart';
import 'package:business_banking/features/statement/bloc/statement_bloc.dart';

import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

class StatementUseCaseMock extends Mock implements StatementUseCase {}

class StatementCardUseCaseMock extends Mock implements StatementCardUseCase {}

void main() {
  StatementBloc bloc;
  StatementCardUseCaseMock mockStatementCardUseCase;
  StatementUseCaseMock mockStatementUseCase;
  setUp(() {
    mockStatementCardUseCase = StatementCardUseCaseMock();
    mockStatementUseCase = StatementUseCaseMock();
    bloc = StatementBloc(
        statementCardUseCase: mockStatementCardUseCase,
        statementUseCase: mockStatementUseCase);
  });

  tearDown(() {
    bloc.dispose();
  });
  group('', () {
    test(
        'statementCardViewModelPipe streams out StatementViewModel to listeners.',
        () {
      bloc.statementCardViewModelPipe.receive.listen((model) {
        verify(mockStatementCardUseCase.create()).called(1);
      });
    });

    test(
        'statementChartViewModelPipe streams out StatementViewModel to listeners.',
        () {
      bloc.statementViewModelPipe.receive.listen((model) {
        verify(mockStatementCardUseCase.create()).called(1);
      });
    });
  });
}
