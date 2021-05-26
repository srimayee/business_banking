import 'package:business_banking/features/stocks_portfolio/api/delete_stock_requestModel.dart';
import 'package:business_banking/features/stocks_portfolio/api/delete_stock_responseModel.dart';
import 'package:business_banking/locator.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework/clean_framework_defaults.dart';

class DeleteStockService
    extends EitherService<DeleteStockRequestModel, DeleteStockResponseModel> {
  DeleteStockService()
      : super(
            method: RestMethod.post,
            restApi: ExampleLocator().api,
            path: 'delete-stock');

  @override
  parseResponse(Map<String, dynamic> jsonResponse) {
    return DeleteStockResponseModel.fromJson(jsonResponse);
  }
}
