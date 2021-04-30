import 'package:business_banking/features/budget/model/budget_entity.dart';
import 'package:business_banking/features/budget/model/budget_view_model.dart';
import 'package:business_banking/locator.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework/clean_framework_defaults.dart';

import 'accounts_service_adapter.dart';

class AccountsCardUseCase extends UseCase {
  Function(ViewModel) _viewModelCallBack;

  RepositoryScope? _scope;

  AccountsCardUseCase(Function(ViewModel) viewModelCallBack)
      : _viewModelCallBack = viewModelCallBack;

  void create() async {
    _scope = ExampleLocator().repository.containsScope<BudgetEntity>();
    if (_scope == null) {
      final newEntity = BudgetEntity();
      _scope = ExampleLocator()
          .repository
          .create<BudgetEntity>(newEntity, _notifySubscribers);
    } else {
      _scope!.subscription = _notifySubscribers;
    }

    await ExampleLocator()
        .repository
        .runServiceAdapter(_scope!, AccountsServiceAdapter());
  }

  void _notifySubscribers(entity) {
    _buildViewModelForServiceUpdate(entity);
  }

  _buildViewModelForServiceUpdate(BudgetEntity entity) async {
    if (entity.hasErrors()) {
      _viewModelCallBack(BudgetViewModel(
          accountInfo: entity.accountInfo,
          accounts: entity.accounts!,
          allTransactions: entity.allTransactions!,
          filteredTransactions: entity.filteredTransactions!,
          serviceStatus: TransactionsServiceStatus.fail,
          chartData: []));
    } else {
      _viewModelCallBack(BudgetViewModel(
          accountInfo: entity.accountInfo,
          accounts: entity.accounts!,
          allTransactions: entity.allTransactions!,
          filteredTransactions: entity.filteredTransactions!,
          serviceStatus: TransactionsServiceStatus.success,
          chartData: []));
    }
  }

  void selectedAccountWithRowIndex(int index) async {
    final entity = ExampleLocator().repository.get<BudgetEntity>(_scope!);

    final _account = entity.selectedItem(index);
    if (_account != null) {
      final updatedEntity = entity.merge(accountInfo: _account);
      ExampleLocator().repository.update<BudgetEntity>(_scope!, updatedEntity);
    }
  }
}
