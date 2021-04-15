import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework/clean_framework_defaults.dart';
import 'package:business_banking/features/customer/bloc/customer_service_adapter.dart';
import 'package:business_banking/features/customer/model/customer_entity.dart';
import 'package:business_banking/features/customer/model/customer_view_model.dart';
import 'package:business_banking/locator.dart';

class CustomerUseCase extends UseCase {
  Function(ViewModel) _viewModelCallBack;

  RepositoryScope? _scope;

  CustomerUseCase(Function(ViewModel) viewModelCallBack)
      : assert(viewModelCallBack != null),
        _viewModelCallBack = viewModelCallBack;

  void create() async {
    _scope = ExampleLocator().repository.containsScope<CustomerEntity>();
    if (_scope == null) {
      final newCustomerEntity = CustomerEntity();
      _scope = ExampleLocator().repository.create<CustomerEntity>(
          newCustomerEntity, _notifySubscribers);
    } else {
      _scope!.subscription = _notifySubscribers;
    }

    await ExampleLocator()
        .repository
        .runServiceAdapter(_scope!, CustomerServiceAdapter());
  }

  void _notifySubscribers(entity) {
    _viewModelCallBack(buildViewModel(entity));
  }

  CustomerViewModel buildViewModel(CustomerEntity entity) {
    return CustomerViewModel(customerEntity: entity);
  }
}
