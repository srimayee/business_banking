import 'package:business_banking/features/cash_accounts/model/account_detail/account_detail_view_model.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework/clean_framework_defaults.dart';
import 'package:business_banking/features/cash_accounts/bloc/account_detail/account_detail_service_adapter.dart';
import 'package:business_banking/features/cash_accounts/model/account_detail/account_detail_entity.dart';
import 'package:business_banking/locator.dart';


class AccountDetailUseCase extends UseCase {
  Function(ViewModel) _viewModelCallBack;

  RepositoryScope _scope;

  AccountDetailUseCase(Function(ViewModel) viewModelCallBack)
      : assert(viewModelCallBack != null),
        _viewModelCallBack = viewModelCallBack;

  void create() async {
    _scope = ExampleLocator().repository.containsScope<AccountDetailEntity>();
    if (_scope == null) {
      final newAccountDetailEntity = AccountDetailEntity();
      _scope = ExampleLocator().repository.create<AccountDetailEntity>(
          newAccountDetailEntity, _notifySubscribers);
    } else {
      _scope.subscription = _notifySubscribers;
    }

    await ExampleLocator()
        .repository
        .runServiceAdapter(_scope, AccountDetailServiceAdapter());
  }

  void _notifySubscribers(entity) {
    _viewModelCallBack(buildViewModel(entity));
  }

  AccountDetailViewModel buildViewModel(AccountDetailEntity entity) {
    return AccountDetailViewModel(
        transactionTitle: entity.transactionTitle,
        transactionNumber: entity.transactionNumber,
        transactionAmount: entity.transactionAmount,
        transactionId: entity.transactionId,
        transactionDetails: entity.transactionDetails,
        transactionHolds: entity.transactionHolds);
  }
}
