import 'package:business_banking/features/stocks_detail/bloc/stocks_service_adapter.dart';
import 'package:business_banking/features/stocks_detail/model/stocks_entity.dart';
import 'package:business_banking/features/stocks_detail/model/stocks_list_view_model.dart';
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
    _scope = ExampleLocator().repository.containsScope<StocksEntity>()!;
    final entity = ExampleLocator().repository.get<StocksEntity>(_scope);
    _scope.subscription = _notifySubscribers;

    await ExampleLocator()
        .repository
        .runServiceAdapter(_scope, StocksServiceAdapter());
  }

  void _notifySubscribers(entity) {
    _viewModelCallback(buildViewModel(entity));
  }

  StocksListViewModel buildViewModel(StocksEntity stocksEntity) {
    return StocksListViewModel(stocksList: stocksEntity.stocks);
  }

  Future<void> deleteStock(int index) async {
    final entity = ExampleLocator().repository.get<StocksEntity>(_scope);
    await ExampleLocator()
        .repository
        .runServiceAdapter(_scope, DeleteStockServiceAdapter());
    // entity.deleteStockAtIndex(index);
  }
}
