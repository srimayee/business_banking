import 'package:business_banking/features/billpay/bloc/billpay_service_adapter.dart';
import 'package:business_banking/features/billpay/model/billpay_entity.dart';
import 'package:business_banking/features/billpay/model/billpay_view_model.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework/clean_framework_defaults.dart';
import 'package:business_banking/locator.dart';

class BillPayUseCase extends UseCase {
  //
  Function(ViewModel) _viewModelCallBack;

  RepositoryScope _scope;

  BillPayUseCase(Function(ViewModel) viewModelCallBack)
      : assert(viewModelCallBack != null),
        _viewModelCallBack = viewModelCallBack;

  void create() async {
    _scope = ExampleLocator().repository.containsScope<BillPayEntity>();
    if (_scope == null) {
      final newLoginEntity = BillPayEntity();
      _scope = ExampleLocator()
          .repository
          .create<BillPayEntity>(newLoginEntity, _notifySubscribers);
    } else {
      _scope.subscription = _notifySubscribers;
    }
    final entity = ExampleLocator().repository.get<BillPayEntity>(_scope);
    _viewModelCallBack(buildIniitalViewModel(entity));
  }

  void startBillPay() async {
    _scope = ExampleLocator().repository.containsScope<BillPayEntity>();
    if (_scope == null) {
      final newCashAccountsEntity = BillPayEntity();
      _scope = ExampleLocator()
          .repository
          .create<BillPayEntity>(newCashAccountsEntity, _notifySubscribers);
    } else {
      _scope.subscription = _notifySubscribers;
    }
    await ExampleLocator()
        .repository
        .runServiceAdapter(_scope, BillPayServiceAdapter());
  }

  void _notifySubscribers(entity) {
    _viewModelCallBack(buildViewModel(entity));
  }

  BillPayViewModel buildIniitalViewModel(BillPayEntity entity) {
    return BillPayViewModel(amount: 0);
  }

  BillPayViewModel buildViewModel(BillPayEntity entity) {
    if (entity.hasErrors()) {
      return BillPayViewModel(
          amount: entity.amount, serviceStatus: ServiceStatus.fail);
    } else {
      return BillPayViewModel(
          amount: entity.amount, serviceStatus: ServiceStatus.success);
    }
  }
}
