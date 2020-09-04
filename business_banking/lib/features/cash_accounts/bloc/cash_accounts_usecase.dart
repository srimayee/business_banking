import 'package:clean_framework/clean_framework.dart';
import 'package:business_banking/features/cash_accounts/model/cash_accounts_view_model.dart';
import 'package:business_banking/features/cash_accounts/model/cash_accounts_entity.dart';
import 'package:business_banking/features/cash_accounts/bloc/cash_accounts_service_adapter.dart';
import 'package:business_banking/example_locator.dart';

class CashAccountsUseCase extends UseCase {
  Function(ViewModel) _viewModelCallBack;
  
  CashAccountsUseCase(Function(ViewModel) viewModelCallBack) : assert(viewModelCallBack != null), _viewModelCallBack = viewModelCallBack;
  
  void execute() async {
    final scope = ExampleLocator()
        .repository
        .create<CashAccountsEntity>(CashAccountsEntity(), _notifySubscribers);
      
    await ExampleLocator()
        .repository
        .runServiceAdapter(scope, CashAccountsServiceAdapter());
  }
  
  void _notifySubscribers(entity) {
    _viewModelCallBack(buildViewModel(entity));
  }
  
  CashAccountsViewModel buildViewModel(CashAccountsEntity entity) {
    return CashAccountsViewModel(
      name: entity.name,
      lastFour: entity.lastFour,
      balance: entity.balance
    );
  }
}