import 'package:business_banking/features/cash_accounts/bloc/cash_accounts_service_adapter.dart';
import 'package:business_banking/features/cash_accounts/model/cash_accounts_entity.dart';
import 'package:business_banking/features/cash_accounts/model/cash_accounts_view_model.dart';
import 'package:clean_framework/clean_framework.dart';
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
      _scope = ExampleLocator()
          .repository
          .create<CashAccountsEntity>(CashAccountsEntity(), _notifySubscribers);
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

  CashAccountsViewModel buildViewModel(
    CashAccountsEntity cashAccountsListEntityModel,
  ) {
    return CashAccountsViewModel(
      name: cashAccountsListEntityModel.name,
      balance: cashAccountsListEntityModel.balance,
      lastFour: cashAccountsListEntityModel.lastFour,
    );
  }
}
