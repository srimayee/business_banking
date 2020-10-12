import 'package:business_banking/features/cash_accounts/model/cash_accounts_list_view_model.dart';
import 'package:business_banking/locator.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:business_banking/features/cash_accounts/api/cash_accounts_service.dart';
import 'cash_accounts_usecase.dart';

class CashAccountsBloc extends Bloc {
  final bool debugEnabled = false;

  CashAccountsUseCase _useCase;

  /// Create service API pipe.
  final Pipe<CashAccountsViewModelList> cashAccountsViewModelListPipe =
      Pipe<CashAccountsViewModelList>();

  @override
  void dispose() {
    /// Dispose pipe in Life Cycle Dispose.
    cashAccountsViewModelListPipe.dispose();
  }

  CashAccountsBloc({CashAccountsService cashAccountsService}) {
    if (debugEnabled) {
      logger().debug('Cash Accounts Bloc: ' + cashAccountsService.toString());
    }

    cashAccountsViewModelListPipe.onListen(() => _useCase.create());

    if (debugEnabled) {
      logger().debug('Cash Accounts Bloc: Listener Setup');
    }
    _useCase = CashAccountsUseCase(
        (viewModel) => cashAccountsViewModelListPipe.send(viewModel));

    if (debugEnabled) {
      logger().debug('Cash Accounts Bloc Use Case: ' + _useCase.toString());
    }
  }
}
