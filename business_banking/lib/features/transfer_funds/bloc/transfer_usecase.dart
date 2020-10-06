import 'package:business_banking/features/transfer_funds/api/transfer_response_model.dart';
import 'package:business_banking/features/transfer_funds/api/transfer_service.dart';
import 'package:business_banking/features/transfer_funds/bloc/transfer_accounts_from_service_adapter.dart';
import 'package:business_banking/features/transfer_funds/bloc/transfer_accounts_to_service_adapter.dart';
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
          id: entity.id,
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
        toAccounts: entity.toAccounts,
        id: entity.id
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

  Future<bool> submitTransfer() async {
    final entity = ExampleLocator().repository.get<TransferFundsEntity>(_scope);
    if (entity.fromAccount != null && entity.toAccount != null && entity.amount > 0) {

      // Todo this does not update an Entity with new id
      // await ExampleLocator()
      //    .repository
      //    .runServiceAdapter(_scope, serviceAdapter);

      // final serviceAdapter = TransferFundsServiceAdapter();
      final service = TransferFundsService();
      // final requestModel = serviceAdapter.createRequest(entity);
      //  var requestJson = requestModel.toJson();
      // final eitherResponse = await service.request(requestModel: requestModel);
      final eitherResponse = await service.request();
      final TransferFundsResponseModel responseModel = eitherResponse.fold((_) {}, (m) => m);
      final updatedEntity = entity.merge(id: responseModel.confirmation);

      // stderr.writeln("Example Locator Repo Scope: " + ExampleLocator().repository.scopes.toString());
      // stderr.writeln("Example Locator: " + ExampleLocator().api.toString());
      //stderr.writeln("Service Adapter: " + serviceAdapter.toString());
      // stderr.writeln("Scope: " + _scope.toString());
      ExampleLocator().repository.update<TransferFundsEntity>(_scope, updatedEntity);
      _viewModelCallBack(buildViewModelForLocalUpdate(updatedEntity));
      final newEntity = ExampleLocator().repository.get<TransferFundsEntity>(_scope);
      return newEntity.id != null;
    }
    else {
      return false;
    }
  }
}