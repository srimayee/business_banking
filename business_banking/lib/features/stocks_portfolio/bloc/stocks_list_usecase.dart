import 'package:business_banking/features/stocks_portfolio/bloc/stocks_service_adapter.dart';
import 'package:business_banking/features/stocks_portfolio/model/stock_view_model.dart';
import 'package:business_banking/features/stocks_portfolio/model/stocks_list_entity.dart';
import 'package:business_banking/features/stocks_portfolio/model/stocks_list_view_model.dart';
import 'package:business_banking/locator.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework/clean_framework_defaults.dart';

import 'delete_stock_service_adapter.dart';

class StocksListUseCase extends UseCase {
  Repository _repository;
  RepositoryScope? _scope;
  StocksServiceAdapter _stocksServiceAdapter;
  DeleteStockServiceAdapter _deleteStockServiceAdapter;

  Function(ViewModel) _viewModelCallback;
  StocksListUseCase(Function(ViewModel) viewModelCallback,
      {Repository? repository,
      StocksServiceAdapter? stocksServiceAdapter,
      DeleteStockServiceAdapter? deleteStockServiceAdapter})
      : _viewModelCallback = viewModelCallback,
        _repository = repository ?? ExampleLocator().repository,
        _stocksServiceAdapter = stocksServiceAdapter ?? StocksServiceAdapter(),
        _deleteStockServiceAdapter =
            deleteStockServiceAdapter ?? DeleteStockServiceAdapter();

  void getStocksList() async {
    _scope = _repository.containsScope<StocksListEntity>();
    if (_scope == null) {
      _scope = _repository.create<StocksListEntity>(
          StocksListEntity(), notifySubscribers);
    } else {
      _scope!.subscription = notifySubscribers;
    }

    await _repository.runServiceAdapter(_scope!, _stocksServiceAdapter);
  }

  void notifySubscribers(entity) {
    _viewModelCallback(buildViewModel(entity));
  }

  StocksListViewModel buildViewModel(StocksListEntity stocksList) {
    List<StockViewModel> viewModels = [];
    for (var stock in stocksList.stocks) {
      viewModels.add(StockViewModel(stock.company, stock.symbol, stock.atClose,
          stock.shares, stock.value));
    }
    return StocksListViewModel(viewModelList: viewModels);
  }

  Future<void> deleteStock(int index) async {
    await _repository.runServiceAdapter(_scope!, _deleteStockServiceAdapter);
  }
}
