import 'package:business_banking/features/stocks_detail/api/delete_stock_requestModel.dart';
import 'package:business_banking/features/stocks_detail/api/delete_stock_responseModel.dart';
import 'package:business_banking/features/stocks_detail/api/delete_stock_service.dart';
import 'package:business_banking/features/stocks_detail/model/stocks_entity.dart';
import 'package:clean_framework/clean_framework.dart';

class DeleteStockServiceAdapter extends ServiceAdapter<StocksEntity,
    DeleteStockRequestModel, DeleteStockResponseModel, DeleteStockService> {
  DeleteStockServiceAdapter() : super(DeleteStockService());

  @override
  DeleteStockRequestModel createRequest(StocksEntity entity){
    return DeleteStockRequestModel();
  }

  @override
  StocksEntity createEntity(
      StocksEntity initialEntity, DeleteStockResponseModel responseModel) {
    return initialEntity
        .merge(errors: <EntityFailure>[], stocks: responseModel.stocksList);
  }
}
