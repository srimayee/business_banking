// @dart = 2.9
import 'dart:async';

import 'package:business_banking/features/stocks_portfolio/bloc/stock_details_usecase.dart';
import 'package:business_banking/features/stocks_portfolio/bloc/stocks_bloc.dart';
import 'package:business_banking/features/stocks_portfolio/bloc/stocks_list_usecase.dart';
import 'package:business_banking/features/stocks_portfolio/model/stock_entity.dart';
import 'package:business_banking/features/stocks_portfolio/model/stock_view_model.dart';
import 'package:business_banking/features/stocks_portfolio/model/stocks_list_view_model.dart';
import 'package:business_banking/features/stocks_portfolio/model/stocks_portfolio_view_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
// import 'package:mockito/mockito.dart';
// import 'package:test/test.dart';

class MockStocksListUseCase extends Mock implements StocksListUseCase {}

class MockStockDetailsUseCase extends Mock implements StockDetailsUseCase {}

void main() {
  final bloc = StocksBloc();
  List<StockEntity> stocksList = [
    StockEntity(
        company: 'Amazon.com',
        symbol: 'AMZN',
        atClose: 89.38,
        shares: 100.0,
        value: 89.38),
    StockEntity(
        company: 'Disney',
        symbol: 'DIS',
        atClose: 40.65,
        shares: 100.0,
        value: 40.65),
    StockEntity(
        company: 'PepsiCo',
        symbol: 'PEP',
        atClose: 38.02,
        shares: 100.0,
        value: 38.02),
    StockEntity(
        company: 'Apple',
        symbol: 'AAPL',
        atClose: 134.22,
        shares: 100.0,
        value: 134.22),
    StockEntity(
        company: 'Home Depot',
        symbol: 'HD',
        atClose: 323.60,
        shares: 100.0,
        value: 323.60),
    StockEntity(
        company: 'Nike',
        symbol: 'NIKE',
        atClose: 130.19,
        shares: 100.0,
        value: 130.19)
  ];
  test('StocksBloc get correct StocksPortfolioViewModel', () {
    bloc.stocksPortfolioViewModelPipe.receive.listen(expectAsync1((model) {
      expect(model, isA<StocksPortfolioViewModel>());
      expect(model.stocksList, stocksList);
    }));
  });

  test('StocksBloc gets correct StocksListViewModel', () {
    List<StockViewModel> viewModelList = [
      StockViewModel('Amazon.com', 'AMZN', 89.38, 100.0, 89.38),
      StockViewModel('Disney', 'DIS', 40.65, 100.0, 40.65),
      StockViewModel('PepsiCo', 'PEP', 38.02, 100.0, 38.02),
      StockViewModel('Apple', 'AAPL', 134.22, 100.0, 134.22),
      StockViewModel('Home Depot', 'HD', 323.6, 100.0, 323.60),
      StockViewModel('Nike', 'NIKE', 130.19, 100.0, 130.19),
    ];
    bloc.stocksListViewModelPipe.receive.listen(expectAsync1((model) {
      expect(model, isA<StocksListViewModel>());
      expect(model.viewModelList, viewModelList);
    }));
  });

  test('StocksBloc _deleteStock calls StocksListUseCase.deleteStock', () {
    MockStocksListUseCase mockUC = MockStocksListUseCase();
    StocksBloc stockbloc = StocksBloc(stocksListUseCase: mockUC);

    stockbloc.deleteStockPipe.send(1);
    var timer = Timer(Duration(milliseconds: 200), () {
      verify(mockUC.deleteStock(1));
    });
  });

  test('StocksBloc _stockSelected calls StockDetailsUseCase.showStockDetails',
      () {
    MockStockDetailsUseCase mockUC = MockStockDetailsUseCase();
    StocksBloc stockbloc = StocksBloc(stockDetailsUseCase: mockUC);
    stockbloc.stockSelectedPipe.send('test');
    var timer = Timer(Duration(milliseconds: 200), () {
      verify(mockUC.showStockDetails('test')).called(1);
    });
  });
}
