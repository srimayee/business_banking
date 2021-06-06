// @dart = 2.9
import 'package:business_banking/features/stocks_portfolio/model/stock_entity.dart';
import 'package:business_banking/features/stocks_portfolio/model/stocks_portfolio_view_model.dart';
import 'package:test/test.dart';

void main() {
  StockEntity stockEntity = StockEntity(
      company: 'test', symbol: 'test', atClose: 1.0, shares: 1.0, value: 1.0);
  List<StockEntity> stocksList = [stockEntity];
  test('StocksViewModel initializes ', () async {
    final viewModel = StocksPortfolioViewModel(stocksList: stocksList);

    expect(viewModel.stocksList, stocksList);
  });

  test('StocksViewModel has correct properties', () {
    StocksPortfolioViewModel viewModel =
        StocksPortfolioViewModel(stocksList: stocksList);
    expect(viewModel.props, [
      [stockEntity]
    ]);
  });

  test('StocksViewModel totalValue is correct', () async {
    List<StockEntity> stocks = [
      StockEntity(
          company: 'test',
          symbol: 'test',
          atClose: 1.0,
          shares: 10.0,
          value: 1000.0),
      StockEntity(
          company: 'test',
          symbol: 'test',
          atClose: 1.0,
          shares: 10.0,
          value: 1000.0)
    ];
    StocksPortfolioViewModel viewModel =
        StocksPortfolioViewModel(stocksList: stocks);
    expect(viewModel.totalValue, 20000.0);
  });
}
