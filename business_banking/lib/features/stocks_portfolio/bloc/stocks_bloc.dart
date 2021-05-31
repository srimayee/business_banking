import 'package:business_banking/features/stocks_portfolio/api/stocks_service.dart';
import 'package:business_banking/features/stocks_portfolio/bloc/stock_details_usecase.dart';
import 'package:business_banking/features/stocks_portfolio/bloc/stocks_list_usecase.dart';
import 'package:business_banking/features/stocks_portfolio/bloc/stocks_usecase.dart';
import 'package:business_banking/features/stocks_portfolio/model/stock_details_view_model.dart';
import 'package:business_banking/features/stocks_portfolio/model/stocks_list_view_model.dart';
import 'package:business_banking/features/stocks_portfolio/model/stocks_portfolio_view_model.dart';
import 'package:clean_framework/clean_framework.dart';

class StocksBloc extends Bloc {
  late StocksUseCase _useCase;
  late StocksListUseCase _stocksListUseCase;
  late StockDetailsUseCase _stockDetailsUseCase;
  final stocksPortfolioViewModelPipe = Pipe<StocksPortfolioViewModel>();
  final stocksListViewModelPipe = Pipe<StocksListViewModel>();
  final deleteStockPipe = Pipe<int>();
  final stockSelectedPipe = Pipe<String>();
  final stockDetailsViewModelPipe = Pipe<StockDetailsViewModel>();

  @override
  void dispose() {
    stocksPortfolioViewModelPipe.dispose();
    stocksListViewModelPipe.dispose();
    deleteStockPipe.dispose();
  }

  StocksBloc({StocksService? stocksService}) {
    _useCase = StocksUseCase((viewModel) => stocksPortfolioViewModelPipe
        .send(viewModel as StocksPortfolioViewModel));
    stocksPortfolioViewModelPipe.whenListenedDo(() => _useCase.create());

    _stocksListUseCase = StocksListUseCase((viewModel) =>
        stocksListViewModelPipe.send(viewModel as StocksListViewModel));
    stocksListViewModelPipe.whenListenedDo(() => _stocksListUseCase.create());

    _stockDetailsUseCase = StockDetailsUseCase((viewModel) =>
        stockDetailsViewModelPipe.send(viewModel as StockDetailsViewModel));
    stockDetailsViewModelPipe.whenListenedDo(
        () => _stockDetailsUseCase.createStockDetailsViewModel());

    deleteStockPipe.receive.listen(_deleteStock);
    stockSelectedPipe.receive.listen(_stockSelected);
  }

  void _deleteStock(int index) {
    _stocksListUseCase.deleteStock(index);
  }

  void _stockSelected(String stockName) {}
}
