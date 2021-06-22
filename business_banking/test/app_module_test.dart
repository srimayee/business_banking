import 'dart:convert';

import 'package:app_interview/app_module.dart';
import 'package:app_interview/features_bank/bank_list/model/result_search.dart';
import 'package:app_interview/features_bank/bank_list/bloc/search_by_text_usecase.dart';
import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'utils/json_response.dart';

class DioMock extends Mock implements Dio {}

main() {
  final dio = DioMock();

  initModule(AppModule(), changeBinds: [Bind<Dio>((i) => dio)]);
  test('Deve recuperar o usecase sem erro', () {
    final usecase = Modular.get<SearchByText>();
    expect(usecase, isA<SearchByTextImpl>());
  });

  test('Deve trazer uma lista de ResultSearch', () async {
    when(dio.get(any)).thenAnswer((_) async =>
        Response(data: jsonDecode(jsonResultList), statusCode: 200));

    final usecase = Modular.get<SearchByText>();
    final result = await usecase('joao');

    expect(result | null, isA<List<ResultSearch>>());
  });
}
