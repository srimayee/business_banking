import 'package:business_banking/features/stocks_portfolio/bloc/stock_details_service_adapter.dart';
import 'package:business_banking/features/stocks_portfolio/model/stock_details_entity.dart';
import 'package:business_banking/features/stocks_portfolio/model/stock_details_view_model.dart';
import 'package:business_banking/locator.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework/clean_framework_defaults.dart';

class StockDetailsUseCase extends UseCase {
  Function(ViewModel) _viewModelCallback;
  StockDetailsUseCase(Function(ViewModel) viewModelCallback)
      : _viewModelCallback = viewModelCallback;

  late RepositoryScope _scope;

  void create() async {
    _scope = ExampleLocator()
        .repository
        .create(StockDetailsEntity(), _notifySubscribers);

    await ExampleLocator()
        .repository
        .runServiceAdapter(_scope, StockDetailsServiceAdapter());
  }

  void _notifySubscribers(entity) {
    _viewModelCallback(buildViewModel(entity));
  }

  StockDetailsViewModel buildViewModel(StockDetailsEntity entity) {
    return StockDetailsViewModel(
        company: entity.company,
        symbol: entity.symbol,
        value: entity.value,
        atOpen: entity.atOpen,
        highValue: entity.highValue,
        lowValue: entity.lowValue,
        volume: entity.volume,
        history: entity.history);
  }
}
