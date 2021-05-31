import 'package:business_banking/features/stocks_portfolio/bloc/stocks_service_adapter.dart';
import 'package:business_banking/features/stocks_portfolio/model/stocks_list_entity.dart';
import 'package:business_banking/features/stocks_portfolio/model/stocks_list_view_model.dart';
import 'package:business_banking/locator.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework/clean_framework_defaults.dart';

import 'delete_stock_service_adapter.dart';

class StocksListUseCase extends UseCase {
  Function(ViewModel) _viewModelCallback;
  StocksListUseCase(Function(ViewModel) viewModelCallback)
      : _viewModelCallback = viewModelCallback;
  late RepositoryScope _scope;

  void create() async {
    _scope = ExampleLocator().repository.containsScope<StocksListEntity>()!;

    _scope.subscription = _notifySubscribers;

    await ExampleLocator()
        .repository
        .runServiceAdapter(_scope, StocksServiceAdapter());
  }

  void _notifySubscribers(entity) {
    _viewModelCallback(buildViewModel(entity));
  }

  StocksListViewModel buildViewModel(StocksListEntity stocksEntity) {
    // for (var stock)
    return StocksListViewModel(stocksList: stocksEntity.stocks);
  }

  Future<void> deleteStock(int index) async {
    await ExampleLocator()
        .repository
        .runServiceAdapter(_scope, DeleteStockServiceAdapter());
  }
}
