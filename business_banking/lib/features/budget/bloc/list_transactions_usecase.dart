import 'package:business_banking/features/budget/model/budget_entity.dart';
import 'package:business_banking/features/budget/model/list_transactions_view_model.dart';
import 'package:business_banking/locator.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework/clean_framework_defaults.dart';

class ListTransactionsUseCase extends UseCase {
  Function(ViewModel) _viewModelCallBack;
  late RepositoryScope _scope;

  ListTransactionsUseCase(Function(ViewModel) viewModelCallBack)
      : assert(viewModelCallBack != null),
        _viewModelCallBack = viewModelCallBack;

  void create() async {
    _scope = ExampleLocator().repository.containsScope<BudgetEntity>()!;
    _scope.subscription = _notifyNewsDetailsSubscribers;
    final entity = ExampleLocator().repository.get<BudgetEntity>(_scope);
    _viewModelCallBack(buildViewModelForSelectedNews(entity));
  }

  void _notifyNewsDetailsSubscribers(entity) {
    _viewModelCallBack(buildViewModelForSelectedNews(entity));
  }

  ListTransactionsViewModel buildViewModelForSelectedNews(BudgetEntity entity) {
    return ListTransactionsViewModel(
        filteredTransactions: entity.allTransactions!);
  }

  void applyFilter(String value) async {
    final entity = ExampleLocator().repository.get<BudgetEntity>(_scope);

    final filteredTransactions = entity.filterWith(value);
    if (filteredTransactions != null) {
      _viewModelCallBack(ListTransactionsViewModel(
          filteredTransactions: filteredTransactions));
    }
  }
}
