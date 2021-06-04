import 'package:business_banking/features/stocks_portfolio/bloc/stocks_service_adapter.dart';
import 'package:business_banking/features/stocks_portfolio/model/stock_view_model.dart';
import 'package:business_banking/features/stocks_portfolio/model/stocks_list_entity.dart';
import 'package:business_banking/features/stocks_portfolio/model/stocks_list_view_model.dart';
import 'package:business_banking/locator.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework/clean_framework_defaults.dart';

import 'delete_stock_service_adapter.dart';

class StocksListUseCase extends UseCase {
  Repository repository;
  RepositoryScope? _scope;

  Function(ViewModel) _viewModelCallback;
  StocksListUseCase(
    Function(ViewModel) viewModelCallback,
    this.repository,
  ) : _viewModelCallback = viewModelCallback;

  void getStocksList() async {
    _scope = repository.containsScope<StocksListEntity>();
    if (_scope == null) {
      _scope = repository.create<StocksListEntity>(
          StocksListEntity(), notifySubscribers);
    } else {
      _scope!.subscription = notifySubscribers;
    }

    await repository.runServiceAdapter(_scope!, StocksServiceAdapter());
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
    await repository.runServiceAdapter(_scope!, DeleteStockServiceAdapter());
  }
}
