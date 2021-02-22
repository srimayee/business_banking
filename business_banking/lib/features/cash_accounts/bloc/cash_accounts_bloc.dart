import 'package:business_banking/features/cash_accounts/model/cash_accounts_view_model.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:business_banking/features/cash_accounts/api/cash_accounts_service.dart';
import 'cash_accounts_usecase.dart';

class CashAccountsBloc extends Bloc {
  CashAccountsUseCase _useCase;

  final cashAccountsViewModelListPipe = Pipe<CashAccountsViewModel>();

  @override
  void dispose() {
    cashAccountsViewModelListPipe.dispose();
  }

  CashAccountsBloc({CashAccountsService cashAccountsService}) {
    _useCase = CashAccountsUseCase(
        (viewModel) => cashAccountsViewModelListPipe.send(viewModel));
    cashAccountsViewModelListPipe.whenListenedDo(() => _useCase.create());
  }
}
