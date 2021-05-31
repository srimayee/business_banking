import 'package:business_banking/features/stocks_portfolio/bloc/stocks_bloc.dart';
import 'package:business_banking/features/stocks_portfolio/model/stock_entity.dart';
import 'package:business_banking/features/stocks_portfolio/model/stock_view_model.dart';
import 'package:business_banking/features/stocks_portfolio/model/stocks_list_view_model.dart';
import 'package:business_banking/features/stocks_portfolio/model/stocks_portfolio_view_model.dart';
// import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

void main() {
  final bloc = StocksBloc();
  List<StockEntity> stocksList = [
    StockEntity(
        company: 'test', symbol: 'test', atClose: 1.0, shares: 1.0, value: 1.0),
    StockEntity(
        company: 'test', symbol: 'test', atClose: 1.0, shares: 1.0, value: 1.0),
    StockEntity(
        company: 'test', symbol: 'test', atClose: 1.0, shares: 1.0, value: 1.0),
    StockEntity(
        company: 'test', symbol: 'test', atClose: 1.0, shares: 1.0, value: 1.0),
    StockEntity(
        company: 'test', symbol: 'test', atClose: 1.0, shares: 1.0, value: 1.0),
    StockEntity(
        company: 'test', symbol: 'test', atClose: 1.0, shares: 1.0, value: 1.0)
  ];
  test('StocksBloc get correct StocksPortfolioViewModel', () {
    bloc.stocksPortfolioViewModelPipe.receive.listen(expectAsync1((model) {
      expect(model, isA<StocksPortfolioViewModel>());
      expect(model.stocksList, stocksList);
    }));
  });

  test('StocksBloc gets correct StocksListViewModel', () {
    List<StockViewModel> viewModelList = [
      StockViewModel('Amazon.com', 'AMZN', 89.38, 100.0, 8938.0),
      StockViewModel('Disney', 'DIS', 40.65, 100.0, 4065.0),
      StockViewModel('PepsiCo', 'PEP', 38.02, 100.0, 3802.0),
      StockViewModel('Apple', 'AAPL', 134.22, 100.0, 13422.0),
      StockViewModel('Home Depot', 'HD', 323.6, 100.0, 32360.0),
      StockViewModel('Nike', 'NIKE', 130.19, 100.0, 13019.0),
    ];
    bloc.stocksListViewModelPipe.receive.listen(expectAsync1((model) {
      expect(model, isA<StocksListViewModel>());
      expect(model.viewModelList, viewModelList);
    }));
  });
}
