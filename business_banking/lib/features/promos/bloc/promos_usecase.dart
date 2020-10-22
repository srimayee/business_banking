import 'package:business_banking/features/promos/bloc/promos_service_adapter.dart';
import 'package:business_banking/features/promos/models/promos_entity.dart';
import 'package:business_banking/features/promos/models/promos_view_model.dart';
import 'package:business_banking/locator.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework/clean_framework_defaults.dart';

class PromosUseCase extends UseCase {
  Function(ViewModel) _viewModelCallBack;

  RepositoryScope _scope;

  PromosUseCase(Function(ViewModel) viewModelCallBack)
      : assert(viewModelCallBack != null),
        _viewModelCallBack = viewModelCallBack;

  void create() async {
    _scope = ExampleLocator().repository.containsScope<PromosEntity>();
    if (_scope == null) {
      final promosEntity = PromosEntity();
      _scope = ExampleLocator().repository.create<PromosEntity>(promosEntity, _notifySubscribers);
    } else {
      _scope.subscription = _notifySubscribers;
    }

    await ExampleLocator().repository.runServiceAdapter(_scope, PromoServiceAdapter());
  }

  void _notifySubscribers(entity) {
    _viewModelCallBack(buildViewModel(entity));
  }

  PromosViewModel buildViewModel(PromosEntity entity) {
    return PromosViewModel(
      imageUrl: entity.imageUrl,
      link: entity.link,
    );
  }
}
