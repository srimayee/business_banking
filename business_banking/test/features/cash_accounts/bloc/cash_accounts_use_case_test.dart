import 'package:business_banking/features/cash_accounts/model/cash_accounts_entity.dart';
import 'package:business_banking/features/cash_accounts/model/cash_accounts_view_model.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:business_banking/locator.dart';
import 'package:clean_framework/clean_framework_defaults.dart';

class CashAccountsUseCaseMock extends UseCase {
  Function(ViewModel) _viewModelCallBack;
  RepositoryScope _scope;

  CashAccountsUseCaseMock(Function(ViewModel) viewModelCallBack)
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

    /// Don't make HTTP Request from the Service Adapter
    /// -> For Testing this is omitted
    // await ExampleLocator()
    //     .repository.runServiceAdapter(_scope, CashAccountsServiceAdapter());
  }

  void _notifySubscribers(entity) {
    _viewModelCallBack(buildViewModel(entity));
  }

  CashAccountsViewModel buildViewModel(CashAccountsEntity cashAccountsEntity) {
    return CashAccountsViewModel(
      name: cashAccountsEntity.name,
      balance: cashAccountsEntity.balance,
      lastFour: cashAccountsEntity.lastFour,
    );
  }
}
