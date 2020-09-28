import 'package:business_banking/features/cash_accounts/model/cash_accounts_list_view_model.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:business_banking/features/cash_accounts/api/cash_accounts_service.dart';
import 'cash_accounts_usecase.dart';

class CashAccountsBloc extends Bloc {
  CashAccountsUseCase _useCase;

  /// Create service API pipe.
  final cashAccountsListViewModelPipe = Pipe<CashAccountsListViewModel>();

  @override
  void dispose() {
    /// Dispose pipe in Life Cycle Dispose.
    cashAccountsListViewModelPipe.dispose();
  }

  CashAccountsBloc({CashAccountsService cashAccountsService}) {
    _useCase = CashAccountsUseCase((viewModel) => cashAccountsListViewModelPipe.send(viewModel));
    cashAccountsListViewModelPipe.onListen(() => _useCase.create());
  }
}
