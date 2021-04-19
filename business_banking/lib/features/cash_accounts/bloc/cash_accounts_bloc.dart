import 'package:business_banking/features/cash_accounts/model/cash_accounts_view_model.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:business_banking/features/cash_accounts/api/cash_accounts_service.dart';
import 'cash_accounts_usecase.dart';

class CashAccountsBloc extends Bloc {
  late CashAccountsUseCase _useCase;

  final cashAccountsViewModelPipe = Pipe<CashAccountsViewModel>();

  @override
  void dispose() {
    cashAccountsViewModelPipe.dispose();
  }

  //CashAccountsBloc({CashAccountsService? cashAccountsService}) {
    CashAccountsBloc() {

    _useCase = CashAccountsUseCase(
        (viewModel) => cashAccountsViewModelPipe.send(viewModel as CashAccountsViewModel));
    cashAccountsViewModelPipe.whenListenedDo(_useCase.create);
  }
}
