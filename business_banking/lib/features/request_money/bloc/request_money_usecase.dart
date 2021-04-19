import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework/clean_framework_defaults.dart';

import 'package:business_banking/features/request_money/bloc/request_money_service_adapter.dart';
import 'package:business_banking/features/request_money/model/request_money_entity.dart';
import 'package:business_banking/features/request_money/model/request_money_view_model.dart';
import 'package:business_banking/locator.dart';


class RequestMoneyUseCase extends UseCase {
  Function(ViewModel) _viewModelCallBack;

  RepositoryScope? _scope;

  RequestMoneyUseCase(Function(ViewModel) viewModelCallBack)
      : assert(viewModelCallBack != null), _viewModelCallBack = viewModelCallBack;

  void create() async {
    _scope = ExampleLocator().repository.containsScope<RequestMoneyEntity>();
    if (_scope == null) {
      final newRequestMoneyEntity = RequestMoneyEntity();
      _scope = ExampleLocator()
          .repository
          .create<RequestMoneyEntity>(newRequestMoneyEntity, _notifySubscribers);
    } else {
      _scope!.subscription = _notifySubscribers;
    }
    await ExampleLocator()
        .repository
        .runServiceAdapter(_scope!, RequestMoneyServiceAdapter());
  }

  void _notifySubscribers(entity) {
    _viewModelCallBack(buildViewModel(entity));
  }

  RequestMoneyViewModel buildViewModel(RequestMoneyEntity entity) {
    return RequestMoneyViewModel(
        name: entity.name ,
        email: entity.email,
        imageUrl: entity.imageUrl,
        amount: entity.amount,
        memo: entity.memo);
  }
}
