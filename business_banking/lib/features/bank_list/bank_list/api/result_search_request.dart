import 'package:app_interview/features_bank/erros/errors.dart';
import 'package:app_interview/features_bank/bank_list/api/result_search_model.dart';
import 'package:app_interview/features_bank/bank_list/model/search_datasource.dart';
import 'package:dio/dio.dart';

extension on String {
  normalize() {
    return this.replaceAll(" ", "+");
  }
}

class ResultSearchRequest implements SearchDatasource {
  final Dio dio;

  ResultSearchRequest(this.dio);

  @override
  Future<List<ResultSearchModel>> getSearch(String searchText) async {
    final response =
        await dio.get('https://jsonplaceholder.typicode.com/users');

    if (response.statusCode == 200) {
      final list = (response.data as List)
          .map((e) => ResultSearchModel.fromMap(e))
          .toList();
      if (searchText.isNotEmpty) {
        var listResult = list
            .where((element) =>
                element.name.toUpperCase().contains(searchText.toUpperCase()))
            .toList();
        return listResult;
      }
      return list;
    } else {
      throw DatasourceError();
    }
  }
}
