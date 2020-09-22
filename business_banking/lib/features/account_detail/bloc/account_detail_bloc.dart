import 'package:clean_framework/clean_framework.dart';
import 'package:business_banking/features/account_detail/model/account_detail_view_model.dart';
import 'package:business_banking/features/account_detail/api/account_detail_service.dart';
import 'account_detail_usecase.dart';

class AccountDetailBloc extends Bloc {
  AccountDetailUseCase _useCase;

  final accountDetailViewModelPipe = Pipe<AccountDetailViewModel>();

  @override
  void dispose() {
    accountDetailViewModelPipe.dispose();
  }

  AccountDetailBloc({AccountDetailService accountDetailService}) {
    _useCase = AccountDetailUseCase(
        (viewModel) => accountDetailViewModelPipe.send(viewModel));
    accountDetailViewModelPipe.onListen(() => _useCase.create());
  }
}
