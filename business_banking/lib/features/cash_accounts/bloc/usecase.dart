import 'package:business_banking/features/cash_accounts/bloc/service_adapter.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:business_banking/features/cash_accounts/model/view_model.dart';
import 'package:business_banking/features/cash_accounts/model/entity.dart';
import 'package:business_banking/locator.dart';
import 'package:clean_framework/clean_framework_defaults.dart';

class CashAccountsUseCase extends UseCase {
  Function(ViewModel) _viewModelCallBack;

  RepositoryScope _scope;

  CashAccountsUseCase(Function(ViewModel) viewModelCallBack)
      : assert(viewModelCallBack != null),
        _viewModelCallBack = viewModelCallBack;

  void create() async {
    _scope = ExampleLocator().repository.containsScope<CashAccountsEntity>();
    if (_scope == null) {
      final newCashAccountsEntity = CashAccountsEntity();
      _scope = ExampleLocator().repository.create<CashAccountsEntity>(
          newCashAccountsEntity, _notifySubscribers);
    } else {
      _scope.subscription = _notifySubscribers;
    }

    await ExampleLocator()
        .repository
        .runServiceAdapter(_scope, CashAccountsServiceAdapter());
  }

  void _notifySubscribers(entity) {
    _viewModelCallBack(buildViewModel(entity));
  }

  CashAccountsViewModel buildViewModel(CashAccountsEntity entity) {
    return CashAccountsViewModel(
        accountType: entity.accountType,
        accountTitle: entity.accountTitle,
        accountNumber: entity.accountNumber,
        accountBalance: entity.accountBalance,
        accountStatus: entity.accountStatus);
  }
}
