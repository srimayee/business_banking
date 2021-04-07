import 'package:business_banking/features/transaction_detail/bloc/transaction_details_service_adapter.dart';
import 'package:business_banking/features/transaction_detail/model/transaction_details_entity.dart';
import 'package:business_banking/features/transaction_detail/model/transaction_details_view_model.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework/clean_framework_defaults.dart';
import 'package:business_banking/locator.dart';

class TransactionDetailsUseCase extends UseCase {
  Function(ViewModel) _viewModelCallBack;

  RepositoryScope _scope;

  TransactionDetailsUseCase(Function(ViewModel) viewModelCallBack)
      : assert(viewModelCallBack != null),
        _viewModelCallBack = viewModelCallBack;

  void create() async {
    _scope =
        ExampleLocator().repository.containsScope<TransactionDetailsEntity>();
    if (_scope == null) {
      final newTransactionDetail = TransactionDetailsEntity();
      _scope = ExampleLocator().repository.create<TransactionDetailsEntity>(
          newTransactionDetail, _notifySubscribers);
    } else {
      _scope.subscription = _notifySubscribers;
    }

    await ExampleLocator()
        .repository
        .runServiceAdapter(_scope, TransactionDetailsServiceAdapter());
  }

  void _notifySubscribers(entity) {
    _viewModelCallBack(buildViewModel(entity));
  }

  TransactionDetailsViewModel buildViewModel(TransactionDetailsEntity entity) {
    return TransactionDetailsViewModel(
        transactionDetails: entity.transactionDetails);
  }
}
