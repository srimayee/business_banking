import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework/clean_framework_defaults.dart';
import 'package:business_banking/features/hello_customer/bloc/hello_customer_service_adapter.dart';
import 'package:business_banking/features/hello_customer/model/hello_customer_entity.dart';
import 'package:business_banking/features/hello_customer/model/hello_customer_view_model.dart';
import 'package:business_banking/locator.dart';

class HelloCustomerUseCase extends UseCase {
  Function(ViewModel) _viewModelCallBack;

  RepositoryScope _scope;

  HelloCustomerUseCase(Function(ViewModel) viewModelCallBack)
      : assert(viewModelCallBack != null),
        _viewModelCallBack = viewModelCallBack;

  void create() async {
    _scope = ExampleLocator().repository.containsScope<HelloCustomerEntity>();
    if (_scope == null) {
      final newHelloCustomerEntity = HelloCustomerEntity();
      _scope = ExampleLocator().repository.create<HelloCustomerEntity>(
          newHelloCustomerEntity, _notifySubscribers);
    } else {
      _scope.subscription = _notifySubscribers;
    }

    await ExampleLocator()
        .repository
        .runServiceAdapter(_scope, HelloCustomerServiceAdapter());
  }

  void _notifySubscribers(entity) {
    _viewModelCallBack(buildViewModel(entity));
  }

  HelloCustomerViewModel buildViewModel(HelloCustomerEntity entity) {
    return HelloCustomerViewModel(customerEntity: entity);
  }
}
