import 'package:clean_framework/clean_framework.dart';
import 'package:business_banking/features/cash_accounts/model/view_model.dart';
import 'package:business_banking/features/cash_accounts/api/service.dart';
import 'usecase.dart';

class CashAccountsBloc extends Bloc {
  CashAccountsUseCase _useCase;

  /// Create service API pipe.
  final cashAccountsViewModelPipe = Pipe<CashAccountsViewModel>();

  @override
  void dispose() {
    /// Dispose pipe in Life Cycle Dispose.
    cashAccountsViewModelPipe.dispose();
  }

  CashAccountsBloc({CashAccountsService cashAccountsService}) {
    _useCase = CashAccountsUseCase(
        (viewModel) => cashAccountsViewModelPipe.send(viewModel));
    cashAccountsViewModelPipe.onListen(() => _useCase.create());
  }
}
