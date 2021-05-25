import 'dart:convert';

import 'package:app_interview/features_bank/erros/errors.dart';
import 'package:app_interview/features_bank/bank_list/api/result_search_request.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../utils/json_response.dart';

class DioMock extends Mock implements Dio {}

main() {
  final dio = DioMock();
  final datasource = ResultSearchRequest(dio);

  test('deve retornar uma lista de ResultSearchModel', () async {
    when(dio.get(any)).thenAnswer((_) async =>
        Response(data: jsonDecode(jsonResultList), statusCode: 200));
    final future = datasource.getSearch("filipe");
    expect(future, completes);
  });

  test('deve retornar uma DatasourceError se o codigo não for 200', () async {
    when(dio.get(any))
        .thenAnswer((_) async => Response(data: null, statusCode: 401));
    final future = datasource.getSearch("filipe");
    expect(future, throwsA(isA<DatasourceError>()));
  });

  test('deve retornar um Excpetion se tiver um erro no dio', () async {
    when(dio.get(any)).thenThrow(Exception());
    final future = datasource.getSearch("filipe");
    expect(future, throwsA(isA<Exception>()));
  });
}
