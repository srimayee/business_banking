import 'package:business_banking/features/budget/api/transactions_json_response_model.dart';
import 'package:business_banking/locator.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework/clean_framework_defaults.dart';

class TransactionsService
    extends EitherService<JsonRequestModel, TransactionsJsonResponseModel> {
  TransactionsService()
      : super(
            method: RestMethod.get,
            restApi: ExampleLocator().api,
            path: 'transactions');

  @override
  TransactionsJsonResponseModel parseResponse(
          Map<String, dynamic> jsonResponse) =>
      TransactionsJsonResponseModel.fromJson(jsonResponse);
}
