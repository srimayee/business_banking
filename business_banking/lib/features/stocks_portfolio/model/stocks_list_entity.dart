import 'package:business_banking/features/stocks_portfolio/model/stock_entity.dart';
import 'package:clean_framework/clean_framework.dart';

class StocksListEntity extends Entity {
  final List<StockEntity> stocks;

  StocksListEntity(
      {List<EntityFailure> errors = const [], List<StockEntity>? stocks})
      : this.stocks = stocks ?? [];

  @override
  List<Object> get props => [errors, stocks];

  @override
  StocksListEntity merge({errors, List<StockEntity>? stocks}) {
    return StocksListEntity(
      errors: errors ?? this.errors,
      stocks: stocks ?? this.stocks,
    );
  }

  List<StockEntity> entityListFromJson(List<Map<String, dynamic>> json) {
    List<StockEntity> stockEntities = [];
    json.forEach((stock) {
      StockEntity entity = StockEntity(
          company: stock['company'],
          symbol: stock['symbol'],
          atClose: stock['at_close'],
          shares: stock['shares'],
          value: stock['value']);
      stockEntities.add(entity);
    });

    return stockEntities;
  }
}
