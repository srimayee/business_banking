import 'package:business_banking/features/stocks_portfolio/bloc/stock_details_service_adapter.dart';
import 'package:business_banking/features/stocks_portfolio/model/stock_details_entity.dart';
import 'package:business_banking/features/stocks_portfolio/model/stock_details_view_model.dart';
import 'package:business_banking/locator.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework/clean_framework_defaults.dart';

class StockDetailsUseCase extends UseCase {
  Function(ViewModel) _viewModelCallback;
  Repository _repository;
  RepositoryScope? _scope;
  StockDetailsServiceAdapter _stockDetailsServiceAdapter;
  String? companyName;

  StockDetailsUseCase(Function(ViewModel) viewModelCallback,
      {Repository? repository,
      StockDetailsServiceAdapter? stockDetailsServiceAdapter})
      : _viewModelCallback = viewModelCallback,
        _repository = repository ?? ExampleLocator().repository,
        _stockDetailsServiceAdapter =
            stockDetailsServiceAdapter ?? StockDetailsServiceAdapter();

  void getStockDetails() async {
    _scope = _repository.containsScope<StockDetailsEntity>();
    if (_scope == null) {
      _scope = _repository.create(
          StockDetailsEntity(company: companyName), notifySubscribers);
    } else {
      _scope!.subscription = notifySubscribers;
    }

    await _repository.runServiceAdapter(_scope!, _stockDetailsServiceAdapter);
  }

  void notifySubscribers(entity) {
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

  Future<void> showStockDetails(String name) async {
    companyName = name;

    // TODO
    // Due to issue of multiple blocs being created the conditional below is not needed
    // until that is resolved

    // if (_scope == null) {
    //   companyName = name;
    // } else {
    //   _repository.update(_scope!, StockDetailsEntity(company: name));
    //   await _repository.runServiceAdapter(_scope!, _stockDetailsServiceAdapter);
    // }
  }
}
