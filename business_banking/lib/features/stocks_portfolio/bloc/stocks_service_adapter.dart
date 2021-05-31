import 'package:business_banking/features/stocks_portfolio/api/stocks_service.dart';
import 'package:business_banking/features/stocks_portfolio/api/stocks_service_response_model.dart';
import 'package:business_banking/features/stocks_portfolio/model/stock_entity.dart';
import 'package:business_banking/features/stocks_portfolio/model/stocks_list_entity.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework/clean_framework_defaults.dart';

class StocksServiceAdapter extends ServiceAdapter<StocksListEntity,
    JsonRequestModel, StocksServiceResponseModel, StocksService> {
  StocksServiceAdapter() : super(StocksService());

  @override
  StocksListEntity createEntity(StocksListEntity stocksListEntity,
      StocksServiceResponseModel responseModel) {
    List<StockEntity> stockEntities =
        stocksListEntity.entityListFromJson(responseModel.stocks);

    return stocksListEntity.merge(stocks: stockEntities);
  }
}
