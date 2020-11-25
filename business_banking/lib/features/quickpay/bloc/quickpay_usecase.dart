import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework/clean_framework_defaults.dart';

import 'package:business_banking/features/quickpay/bloc/quickpay_service_adapter.dart';
import 'package:business_banking/features/quickpay/model/quickpay_entity.dart';
import 'package:business_banking/features/quickpay/model/quickpay_view_model.dart';
import 'package:business_banking/locator.dart';


class QuickPayUseCase extends UseCase {
  Function(ViewModel) _viewModelCallBack;

  RepositoryScope _scope;

  QuickPayUseCase(Function(ViewModel) viewModelCallBack)
      : assert(viewModelCallBack != null), _viewModelCallBack = viewModelCallBack;

  void create() async {
    _scope = ExampleLocator().repository.containsScope<QuickPayEntity>();
    if (_scope == null) {
      final newQuickPayEntity = QuickPayEntity();
      _scope = ExampleLocator()
      .repository
      .create<QuickPayEntity>(newQuickPayEntity, _notifySubscribers);
    } else {
      _scope.subscription = _notifySubscribers;
    }

    await ExampleLocator()
        .repository
        .runServiceAdapter(_scope, QuickPayServiceAdapter());
    print("something");
  }

  void _notifySubscribers(entity) {
    _viewModelCallBack(buildViewModel(entity));
  }

  QuickPayViewModel buildViewModel(QuickPayEntity entity) {
    return QuickPayViewModel(
        name: entity.name ,
        email: entity.email,
        imageUrl: entity.imageUrl);
  }
}
