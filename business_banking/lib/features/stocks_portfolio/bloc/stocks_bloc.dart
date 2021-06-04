import 'package:business_banking/features/stocks_portfolio/api/stocks_service.dart';
import 'package:business_banking/features/stocks_portfolio/bloc/stock_details_usecase.dart';
import 'package:business_banking/features/stocks_portfolio/bloc/stocks_list_usecase.dart';
import 'package:business_banking/features/stocks_portfolio/bloc/stocks_usecase.dart';
import 'package:business_banking/features/stocks_portfolio/model/stock_details_view_model.dart';
import 'package:business_banking/features/stocks_portfolio/model/stocks_list_view_model.dart';
import 'package:business_banking/features/stocks_portfolio/model/stocks_portfolio_view_model.dart';
import 'package:business_banking/locator.dart';
import 'package:clean_framework/clean_framework.dart';

class StocksBloc extends Bloc {
  late final StocksUseCase _stockUseCase;
  late final StocksListUseCase _stocksListUseCase;
  late final StockDetailsUseCase _stockDetailsUseCase;
  final stocksPortfolioViewModelPipe = Pipe<StocksPortfolioViewModel>();
  final stocksListViewModelPipe = Pipe<StocksListViewModel>();
  final deleteStockPipe = Pipe<int>();
  final stockSelectedPipe = Pipe<String>();
  final stockDetailsViewModelPipe =
      Pipe<StockDetailsViewModel>(canSendDuplicateData: true);

  @override
  void dispose() {
    stocksPortfolioViewModelPipe.dispose();
    stocksListViewModelPipe.dispose();
    deleteStockPipe.dispose();
  }

  StocksBloc() {
    _setUpStocksUseCase();
    _setUpStocksListUseCase();
    _setUpStockDetailsUseCase();

    deleteStockPipe.receive.listen(_deleteStock);
    stockSelectedPipe.receive.listen(_stockSelected);

    print('Bloc: ' + this.hashCode.toString());
  }

  void _setUpStocksUseCase() {
    _stockUseCase = StocksUseCase((viewModel) => stocksPortfolioViewModelPipe
        .send(viewModel as StocksPortfolioViewModel));
    stocksPortfolioViewModelPipe.whenListenedDo(() => _stockUseCase.create());
  }

  void _setUpStocksListUseCase() {
    Function(ViewModel) stocksListVMcallback = (viewModel) =>
        stocksListViewModelPipe.send(viewModel as StocksListViewModel);
    _stocksListUseCase = StocksListUseCase(stocksListVMcallback);
    stocksListViewModelPipe
        .whenListenedDo(() => _stocksListUseCase.getStocksList());
  }

  void _setUpStockDetailsUseCase() {
    _stockDetailsUseCase = StockDetailsUseCase((viewModel) =>
        stockDetailsViewModelPipe.send(viewModel as StockDetailsViewModel));
    stockDetailsViewModelPipe
        .whenListenedDo(() => _stockDetailsUseCase.getStockDetails());
  }

  void _deleteStock(int index) {
    _stocksListUseCase.deleteStock(index);
  }

  void _stockSelected(String stockName) {
    _stockDetailsUseCase.showStockDetails(stockName);
  }
}
