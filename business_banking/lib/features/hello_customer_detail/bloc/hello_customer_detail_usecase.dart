import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework/clean_framework_defaults.dart';
import 'package:business_banking/features/hello_customer_detail/bloc/hello_customer_detail_service_adapter.dart';
import 'package:business_banking/features/hello_customer_detail/model/hello_customer_detail_entity.dart';
import 'package:business_banking/features/hello_customer_detail/model/hello_customer_detail_view_model.dart';
import 'package:business_banking/locator.dart';

class HelloCustomerDetailUseCase extends UseCase {
  Function(ViewModel) _viewModelCallBack;

  RepositoryScope _scope;

  HelloCustomerDetailUseCase(Function(ViewModel) viewModelCallBack)
      : assert(viewModelCallBack != null),
        _viewModelCallBack = viewModelCallBack;

  void create() async {
    _scope =
        ExampleLocator().repository.containsScope<HelloCustomerDetailEntity>();
    if (_scope == null) {
      final newHelloCustomerDetailEntity = HelloCustomerDetailEntity();
      _scope = ExampleLocator().repository.create<HelloCustomerDetailEntity>(
          newHelloCustomerDetailEntity, _notifySubscribers);
    } else {
      _scope.subscription = _notifySubscribers;
    }

    await ExampleLocator()
        .repository
        .runServiceAdapter(_scope, HelloCustomerDetailServiceAdapter());
  }

  void _notifySubscribers(entity) {
    _viewModelCallBack(buildViewModel(entity));
  }

  HelloCustomerDetailViewModel buildViewModel(
      HelloCustomerDetailEntity entity) {
    return HelloCustomerDetailViewModel(
        name: entity.name, currentTimeString: entity.currentTimeString);
  }
}
