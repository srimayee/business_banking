import 'package:app_interview/features_bank/bank_list/model/search_datasource.dart';
import 'package:app_interview/features_bank/bank_list/model/search_repository_impl.dart';
import 'package:app_interview/features_bank/bank_list/model/result_search.dart';
import 'package:app_interview/features_bank/erros/errors.dart';
import 'package:app_interview/features_bank/bank_list/model/search_repository.dart';
import 'package:app_interview/features_bank/bank_list/api/result_search_model.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class SearchDatasourceMock extends Mock implements SearchDatasource {}

main() {
  final datasource = SearchDatasourceMock();
  final repository = SearchRepositoryImpl(datasource);

  test('deve retornar uma lista de ResultSearch', () async {
    when(datasource.getSearch(any))
        .thenAnswer((_) async => <ResultSearchModel>[]);
    final result = await repository.search("joao");

    expect(result | null, isA<List<ResultSearch>>());
  });

  test('deve retornar um DatasourceError se o datasource falhar', () async {
    when(datasource.getSearch(any)).thenThrow(Exception());
    final result = await repository.search("joao");

    expect(result.fold(id, id), isA<DatasourceError>());
  });
}
