import 'package:business_banking/features/stocks_portfolio/api/stock_details_responseModel.dart';
import 'package:business_banking/features/stocks_portfolio/api/stock_details_service.dart';
import 'package:business_banking/features/stocks_portfolio/model/stock_details_entity.dart';
import 'package:business_banking/features/stocks_portfolio/model/stock_details_view_model.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework/clean_framework_defaults.dart';

class StockDetailsServiceAdapter extends ServiceAdapter<StockDetailsEntity,
    JsonRequestModel, StockDetailsResponseModel, StockDetailsService> {
  StockDetailsServiceAdapter() : super(StockDetailsService());

  @override
  StockDetailsEntity createEntity(StockDetailsEntity stockDetailsEntity,
      StockDetailsResponseModel responseModel) {
    return stockDetailsEntity.merge(
        company: responseModel.company,
        symbol: responseModel.symbol,
        value: responseModel.value,
        atOpen: responseModel.atOpen,
        highValue: responseModel.highValue,
        lowValue: responseModel.lowValue,
        volume: responseModel.volume,
        history: responseModel.history);
  }
}
