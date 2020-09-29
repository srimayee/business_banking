import 'package:clean_framework/clean_framework.dart';
import 'package:business_banking/features/mortgage_accounts/model/mortgage_accounts_view_model.dart';
import 'package:business_banking/features/mortgage_accounts/api/mortgage_accounts_service.dart';
import 'package:business_banking/features/mortgage_accounts/bloc/mortgage_accounts_usecse.dart';

class MortgageAccountsBloc extends Bloc {
  MortgageAccountsUseCase _useCase;

  final mortgageAccountsViewModelPipe = Pipe<MortgageAccountsViewModel>();

  @override
  void dispose() {
    mortgageAccountsViewModelPipe.dispose();
  }

  MortgageAccountsBloc({MortgageAccountsService cashAccountsService}) {
    _useCase = MortgageAccountsUseCase((viewModel) => mortgageAccountsViewModelPipe.send(viewModel));
    mortgageAccountsViewModelPipe.onListen(() => _useCase.create());
  }
}