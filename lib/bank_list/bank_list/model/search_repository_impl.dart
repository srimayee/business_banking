import 'package:app_interview/features_bank/erros/errors.dart';
import 'package:app_interview/features_bank/bank_list/model/search_datasource.dart';
import 'package:app_interview/features_bank/bank_list/model/result_search.dart';
import 'package:app_interview/features_bank/bank_list/model/search_repository.dart';
import 'package:dartz/dartz.dart';

class SearchRepositoryImpl implements SearchRepository {
  final SearchDatasource datasource;

  SearchRepositoryImpl(this.datasource);

  @override
  Future<Either<FailureSearch, List<ResultSearch>>> search(
      String searchText) async {
    try {
      final result = await datasource.getSearch(searchText);
      return Right(result);
    } on DatasourceError catch (e) {
      return Left(e);
    } catch (e) {
      return Left(DatasourceError());
    }
  }
}
