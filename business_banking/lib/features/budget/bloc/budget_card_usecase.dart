import 'package:business_banking/features/budget/bloc/budget_service_adapter.dart';
import 'package:business_banking/features/budget/model/budget_entity.dart';
import 'package:business_banking/features/budget/model/budget_view_model.dart';
import 'package:business_banking/locator.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework/clean_framework_defaults.dart';

class BudgetCardUseCase extends UseCase {
  Function(ViewModel) _viewModelCallBack;

  RepositoryScope? _scope;

  BudgetCardUseCase(Function(ViewModel) viewModelCallBack)
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
        .runServiceAdapter(_scope!, BudgetServiceAdapter());
  }

  void _notifySubscribers(entity) {
    _buildViewModelForServiceUpdate(entity);
  }

  _buildViewModelForServiceUpdate(BudgetEntity entity) async {
    if (entity.hasErrors()) {
      _viewModelCallBack(BudgetViewModel(
          accountInfo: entity.accountInfo,
          allTransactions: entity.allTransactions!,
          filteredTransactions: entity.filteredTransactions!,
          serviceStatus: TransactionsServiceStatus.fail,
          chartData: []));
    } else {
      _viewModelCallBack(BudgetViewModel(
          accountInfo: entity.accountInfo,
          allTransactions: entity.allTransactions!,
          filteredTransactions: entity.filteredTransactions!,
          serviceStatus: TransactionsServiceStatus.success,
          chartData: []));
    }
  }
}
