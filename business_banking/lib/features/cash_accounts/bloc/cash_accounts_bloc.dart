import 'package:clean_framework/clean_framework.dart';
import 'package:business_banking/features/cash_accounts/model/cash_accounts_view_model.dart';
import 'package:business_banking/features/cash_accounts/api/cash_accounts_service.dart';
import 'cash_accounts_usecase.dart';

class CashAccountsBloc extends Bloc {
  CashAccountsUseCase _useCase;

  final helloLandingViewModelPipe = Pipe<CashAccountsViewModel>();

  @override
  void dispose() {
    helloLandingViewModelPipe.dispose();
  }

  CashAccountsBloc({CashAccountsService helloLandingService}) {
    _useCase = CashAccountsUseCase((viewModel) => helloLandingViewModelPipe.send(viewModel));
    helloLandingViewModelPipe.onListen(() => _useCase.create());
  }
}