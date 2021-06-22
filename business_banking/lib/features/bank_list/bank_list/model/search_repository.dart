import 'package:app_interview/features_bank/bank_list/model/result_search.dart';
import 'package:app_interview/features_bank/erros/errors.dart';
import 'package:dartz/dartz.dart';

abstract class SearchRepository {
  Future<Either<FailureSearch, List<ResultSearch>>> search(String searchText);
}
