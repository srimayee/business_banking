import 'package:business_banking/features/stocks/model/stocks_entity.dart';
import 'package:business_banking/features/stocks/model/stocks_view_model.dart';
import 'package:business_banking/locator.dart';
import 'package:clean_framework/clean_framework.dart';

import 'stocks_service_adapter.dart';

class StocksUseCase extends UseCase {
  late final ViewModelCallback<ViewModel> _viewModelCallback;
  StocksUseCase(ViewModelCallback<ViewModel> viewModelCallback)
      : _viewModelCallback = viewModelCallback;

  void create() async {
    final scope = ExampleLocator()
        .repository
        .create<StocksEntity>(StocksEntity(), _notifySubscribers);

    await ExampleLocator()
        .repository
        .runServiceAdapter(scope, StocksServiceAdapter());
  }

  void _notifySubscribers(entity) {
    _viewModelCallback(buildViewModel(entity));
  }

  StocksViewModel buildViewModel (StocksEntity stocksEntity){
    return StocksViewModel(stocksList: stocksEntity.stocks);
  }
}
