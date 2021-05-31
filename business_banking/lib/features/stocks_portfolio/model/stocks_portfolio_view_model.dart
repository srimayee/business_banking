import 'package:business_banking/features/stocks_portfolio/model/stock_entity.dart';
import 'package:clean_framework/clean_framework.dart';

class StocksPortfolioViewModel extends ViewModel {
  final List<StockEntity> stocksList;

  StocksPortfolioViewModel({required this.stocksList});

  double get totalValue {
    double value = 0.0;
    for (StockEntity stock in stocksList) {
      value += stock.value ?? 0;
    }

    return value;
  }

  @override
  List<Object?> get props => [stocksList];
}
