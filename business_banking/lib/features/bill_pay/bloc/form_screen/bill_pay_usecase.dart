import 'package:business_banking/features/bill_pay/model/form_screen/bill_pay_entity.dart';
import 'package:business_banking/features/bill_pay/model/form_screen/bill_pay_view_model.dart';
import 'package:business_banking/features/deposit_check/model/enums.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework/clean_framework_defaults.dart';

import '../../../../locator.dart';
import 'bill_pay_post_service_adapter.dart';
import 'bill_pay_retrieval_service_adapter.dart';

class BillPayUseCase extends UseCase {
  late final ViewModelCallback<BillPayViewModel> _viewModelCallBack;
  RepositoryScope? _scope;

  BillPayUseCase(
      ViewModelCallback<BillPayViewModel> viewModelCallBack)
      : _viewModelCallBack = viewModelCallBack;

  void execute() async {
    _scope =
        ExampleLocator().repository.containsScope<BillPayEntity>();
    if (_scope == null) {
      _scope = ExampleLocator().repository.create<BillPayEntity>(
          new BillPayEntity(), _notifySubscribers);

      await ExampleLocator()
          .repository
          .runServiceAdapter(_scope!, BillPayRetrievalServiceAdapter());
    } else {
      _scope!.subscription = _notifySubscribers;
      final entity = ExampleLocator().repository.get<BillPayEntity>(_scope!);
      _notifySubscribers(entity);
    }
  }

  void _notifySubscribers(entity) {
    _viewModelCallBack(buildViewModel(entity));
  }

  BillPayViewModel buildViewModel(BillPayEntity entity) {
    if (entity.hasErrors()) {
      return BillPayViewModel(
        allBills: entity.allBills!,
        selectedBillIndex: entity.selectedBillIndex,
        serviceResponseStatus: ServiceResponseStatus.failed,
        didSucceed: entity.didSucceed,
        referenceNumber: entity.referenceNumber
      );
    } else {
      return BillPayViewModel(
        allBills: entity.allBills!,
        selectedBillIndex: entity.selectedBillIndex,
        serviceResponseStatus: ServiceResponseStatus.succeed,
        didSucceed: entity.didSucceed,
        referenceNumber: entity.referenceNumber
      );
    }
  }

  void updateSelectedBillIndex(int selectedBillIndex) {
    if (_scope == null) {
      _scope = ExampleLocator().repository.create<BillPayEntity>(
          new BillPayEntity(), _notifySubscribers);
    }

    final entity = ExampleLocator().repository.get<BillPayEntity>(_scope!);

    final updatedEntity = entity.merge(selectedBillIndex: selectedBillIndex);
    ExampleLocator()
        .repository
        .update<BillPayEntity>(_scope!, updatedEntity);
    _viewModelCallBack(buildViewModel(updatedEntity));
  }

  Future<void> payBill() async {
    if (_scope == null) {
      _scope = ExampleLocator().repository.create<BillPayEntity>(
          new BillPayEntity(), _notifySubscribers);
    }
    final entity = ExampleLocator().repository.get<BillPayEntity>(_scope!);
    await ExampleLocator()
        .repository
        .runServiceAdapter(_scope!, BillPayPostServiceAdapter());
    //_viewModelCallBack(buildViewModel(entity));
  }
}
