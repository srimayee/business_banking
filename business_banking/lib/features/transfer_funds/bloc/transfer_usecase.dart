import 'package:business_banking/features/transfer_funds/bloc/transfer_accounts_from_service_adapter.dart';
import 'package:business_banking/features/transfer_funds/bloc/transfer_accounts_to_service_adapter.dart';
import 'package:business_banking/features/transfer_funds/bloc/transfer_service_adapter.dart';
import 'package:business_banking/features/transfer_funds/enums.dart';
import 'package:business_banking/features/transfer_funds/model/transfer_entity.dart';
import 'package:business_banking/features/transfer_funds/model/transfer_view_model.dart';
import 'package:business_banking/locator.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework/clean_framework_defaults.dart';

class TransferFundsUseCase extends UseCase {
  Function(ViewModel) _viewModelCallBack;
  RepositoryScope _scope;

  TransferFundsUseCase(Function(ViewModel) viewModelCallBack)
      : assert(viewModelCallBack != null),
        _viewModelCallBack = viewModelCallBack;

  Future<void> create() async {
    _scope = ExampleLocator().repository.containsScope<TransferFundsEntity>();
    if (_scope == null) {
      TransferFundsEntity newTransferEntity = new TransferFundsEntity();
      _scope = ExampleLocator()
          .repository
          .create<TransferFundsEntity>(newTransferEntity, _notifyTransferSubscribers);
    } else {
      _scope.subscription = _notifyTransferSubscribers;
    }

    await ExampleLocator()
        .repository
        .runServiceAdapter(_scope, TransferFundsAccountsFromServiceAdapter());
  }

  TransferFundsEntity getEntity() {
    return ExampleLocator().repository.get(_scope);
  }

  RepositoryScope getScope() {
    return _scope;
  }

  void _notifyTransferSubscribers(entity) {
    _viewModelCallBack(buildViewModelForServiceUpdate(entity));
  }

  TransferFundsViewModel buildViewModelForServiceUpdate(TransferFundsEntity entity) {
    if (entity.hasErrors()) {
      return TransferFundsViewModel(
          fromAccount: entity.fromAccount,
          toAccount: entity.toAccount,
          amount: entity.amount,
          date: entity.date,
          fromAccounts: entity.fromAccounts,
          toAccounts: entity.toAccounts,
          serviceStatus: ServiceStatus.fail);
    } else {
      return TransferFundsViewModel(
          fromAccount: entity.fromAccount,
          toAccount: entity.toAccount,
          amount: entity.amount,
          date: entity.date,
          fromAccounts: entity.fromAccounts,
          toAccounts: entity.toAccounts,
          serviceStatus: ServiceStatus.success);
    }
  }

  TransferFundsViewModel buildViewModelForLocalUpdate(TransferFundsEntity entity) {
    return TransferFundsViewModel(
        fromAccount: entity.fromAccount,
        toAccount: entity.toAccount,
        amount: entity.amount,
        date: entity.date,
        fromAccounts: entity.fromAccounts,
        toAccounts: entity.toAccounts
    );
  }

  Future<void> updateFromAccount(String fromAccount) async {
    final entity = ExampleLocator().repository.get<TransferFundsEntity>(_scope);
    TransferFundsEntity updatedEntity = entity.merge(fromAccount: fromAccount);
    ExampleLocator().repository.update<TransferFundsEntity>(_scope, updatedEntity);
    _viewModelCallBack(buildViewModelForLocalUpdate(updatedEntity));

    await ExampleLocator()
        .repository
        .runServiceAdapter(_scope, TransferFundsAccountsToServiceAdapter());
  }

  void updateToAccount(String toAccount) {
    final entity = ExampleLocator().repository.get<TransferFundsEntity>(_scope);
    final updatedEntity = entity.merge(toAccount: toAccount);
    ExampleLocator().repository.update<TransferFundsEntity>(_scope, updatedEntity);
    _viewModelCallBack(buildViewModelForLocalUpdate(updatedEntity));
  }

  void updateAmount(String value) {
    var amount = double.tryParse(value);
    if (amount != null && amount > 0) {
      final entity = ExampleLocator().repository.get<TransferFundsEntity>(_scope);
      final updatedEntity = entity.merge(amount: amount);
      ExampleLocator().repository.update<TransferFundsEntity>(_scope, updatedEntity);
      _viewModelCallBack(buildViewModelForLocalUpdate(updatedEntity));
    }
  }

  void updateDate(DateTime date) {
    final entity = ExampleLocator().repository.get<TransferFundsEntity>(_scope);
    final updatedEntity = entity.merge(date: date);
    ExampleLocator().repository.update<TransferFundsEntity>(_scope, updatedEntity);
    _viewModelCallBack(buildViewModelForLocalUpdate(updatedEntity));
  }

  Future<bool> updateId() async {
    final entity = ExampleLocator().repository.get<TransferFundsEntity>(_scope);
    if (entity.fromAccount != null && entity.toAccount != null && entity.amount > 0) {
      await ExampleLocator()
          .repository
          .runServiceAdapter(_scope, TransferFundsServiceAdapter());
      return true;
    }
    else {
      return false;
    }
  }
}