import 'package:business_banking/features/stocks_portfolio/api/delete_stock_requestModel.dart';
import 'package:business_banking/features/stocks_portfolio/api/delete_stock_responseModel.dart';
import 'package:business_banking/features/stocks_portfolio/api/delete_stock_service.dart';
import 'package:business_banking/features/stocks_portfolio/model/stock_entity.dart';
import 'package:business_banking/features/stocks_portfolio/model/stocks_list_entity.dart';
import 'package:clean_framework/clean_framework.dart';

class DeleteStockServiceAdapter extends ServiceAdapter<StocksListEntity,
    DeleteStockRequestModel, DeleteStockResponseModel, DeleteStockService> {
  DeleteStockServiceAdapter() : super(DeleteStockService());

  @override
  DeleteStockRequestModel createRequest(StocksListEntity entity) {
    return DeleteStockRequestModel();
  }

  @override
  StocksListEntity createEntity(
      StocksListEntity initialEntity, DeleteStockResponseModel responseModel) {
    List<StockEntity> stockEntities =
        initialEntity.entityListFromJson(responseModel.stocksList);
    return initialEntity
        .merge(errors: <EntityFailure>[], stocks: stockEntities);
  }
}
