import 'package:business_banking/features/stocks_portfolio/model/stocks_list_entity.dart';
import 'package:business_banking/features/stocks_portfolio/model/stocks_portfolio_view_model.dart';
import 'package:business_banking/locator.dart';
import 'package:clean_framework/clean_framework.dart';

import 'stocks_service_adapter.dart';

class StocksUseCase extends UseCase {
  Function(ViewModel) _viewModelCallback;
  StocksUseCase(Function(ViewModel) viewModelCallback)
      : _viewModelCallback = viewModelCallback;

  void create() async {
    final scope = ExampleLocator()
        .repository
        .create<StocksListEntity>(StocksListEntity(), _notifySubscribers);

    await ExampleLocator()
        .repository
        .runServiceAdapter(scope, StocksServiceAdapter());
  }

  void _notifySubscribers(entity) {
    _viewModelCallback(buildViewModel(entity));
  }

  StocksPortfolioViewModel buildViewModel(StocksListEntity stocksEntity) {
    return StocksPortfolioViewModel(stocksList: stocksEntity.stocks);
  }
}
