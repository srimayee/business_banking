// @dart=2.9
import 'package:business_banking/features/statement/bloc/hub_cards/statement_cards_use_case.dart';
import 'package:business_banking/features/statement/bloc/statement/statement_usecase.dart';
import 'package:business_banking/features/statement/bloc/statement_bloc.dart';

import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

class StatementUseCaseMock extends Mock implements StatementUseCase {}

class StatementCardUseCaseMock extends Mock implements StatementCardUseCase {}

void main() {
  test('StatementBloc initialize', () async {
    final bloc = StatementBloc();
    expect(bloc.statementViewModelPipe, isNotNull);
    expect(bloc.statementCardViewModelPipe, isNotNull);
  });

  test('StatementBloc dispose', () async {
    final bloc = StatementBloc();
    bloc.dispose();
    expect(bloc.statementCardViewModelPipe.receive, emitsDone);
    expect(bloc.statementViewModelPipe.receive, emitsDone);
  });

  test('StatementBloc StatementUseCase create on pipe listen', () async {
    StatementUseCaseMock statementUseCaseMock = StatementUseCaseMock();
    StatementBloc bloc = StatementBloc(statementUseCase: statementUseCaseMock);
    bloc.statementViewModelPipe.receive.listen((event) {});
    verify(statementUseCaseMock.create()).called(1);
  });

  test('StatementBloc StatementCardUseCase create on pipe listen', () async {
    StatementCardUseCaseMock statementCardUseCaseMock =
        StatementCardUseCaseMock();
    StatementBloc bloc =
        StatementBloc(statementCardUseCase: statementCardUseCaseMock);
    bloc.statementViewModelPipe.receive.listen((event) {});
    verify(statementCardUseCaseMock.create()).called(1);
  });
}
