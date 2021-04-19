import 'package:business_banking/features/transfer_funds/model/transfer_confirmation_view_model.dart';
import 'package:business_banking/features/transfer_funds/model/transfer_entity.dart';
import 'package:business_banking/locator.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework/clean_framework_defaults.dart';

class TransferConfirmationUseCase extends UseCase {
  Function(ViewModel) _viewModelCallBack;
  RepositoryScope? _scope;

  TransferConfirmationUseCase(Function(ViewModel) viewModelCallBack)
      : assert(viewModelCallBack != null),
        _viewModelCallBack = viewModelCallBack;

  void create() async {
    _scope = ExampleLocator().repository.containsScope<TransferFundsEntity>();
    if (_scope == null) {
      throw StateError('Transfers entity does not exist');
    }

    _scope!.subscription = _notifyTransferSubscribers;
    final entity =
        ExampleLocator().repository.get<TransferFundsEntity>(_scope!);
    _viewModelCallBack(buildViewModelForServiceUpdate(entity));
  }

  void _notifyTransferSubscribers(entity) {
    _viewModelCallBack(buildViewModelForServiceUpdate(entity));
  }

  TransferConfirmationViewModel buildViewModelForServiceUpdate(
      TransferFundsEntity entity) {
    if (entity.hasErrors()) {
      return TransferConfirmationViewModel(
          fromAccount: entity.fromAccount,
          toAccount: entity.toAccount,
          amount: entity.amount,
          date: entity.date,
          id: entity.id);
    } else {
      return TransferConfirmationViewModel(
          fromAccount: entity.fromAccount,
          toAccount: entity.toAccount,
          amount: entity.amount,
          date: entity.date,
          id: entity.id);
    }
  }

  TransferConfirmationViewModel buildViewModelForLocalUpdateWithError(
      TransferFundsEntity entity) {
    return TransferConfirmationViewModel(
        fromAccount: entity.fromAccount,
        toAccount: entity.toAccount,
        amount: entity.amount,
        date: entity.date,
        id: entity.id);
  }

  void clearTransferData() {
    final entity =
        ExampleLocator().repository.get<TransferFundsEntity>(_scope!);
    final emptyEntity = TransferFundsEntity(fromAccounts: entity.fromAccounts);
    ExampleLocator()
        .repository
        .update<TransferFundsEntity>(_scope!, emptyEntity);
  }
}
