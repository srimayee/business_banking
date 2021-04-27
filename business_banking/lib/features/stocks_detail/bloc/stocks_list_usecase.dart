import 'package:business_banking/features/stocks_detail/bloc/stocks_service_adapter.dart';
import 'package:business_banking/features/stocks_detail/model/stocks_entity.dart';
import 'package:business_banking/features/stocks_detail/model/stocks_list_view_model.dart';
import 'package:business_banking/locator.dart';
import 'package:clean_framework/clean_framework.dart';

class StocksListUseCase extends UseCase {
  late final ViewModelCallback<ViewModel> _viewModelCallback;
  StocksListUseCase(ViewModelCallback<ViewModel> viewModelCallback)
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

  StocksListViewModel buildViewModel(StocksEntity stocksEntity) {
    return StocksListViewModel(stocksList: stocksEntity.stocks);
  }
}
