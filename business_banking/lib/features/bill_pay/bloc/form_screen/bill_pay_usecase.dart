import 'package:business_banking/features/bill_pay/model/form_screen/bill_pay_entity.dart';
import 'package:business_banking/features/bill_pay/model/form_screen/bill_pay_view_model.dart';
import 'package:business_banking/features/deposit_check/model/enums.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework/clean_framework_defaults.dart';

import '../../../../locator.dart';
import 'bill_pay_service_adapter.dart';

class BillPayUseCase extends UseCase {
  late final ViewModelCallback<BillPayViewModel> _viewModelCallBack;
  RepositoryScope? _scope;

  BillPayUseCase(
      ViewModelCallback<BillPayViewModel> viewModelCallBack)
      : _viewModelCallBack = viewModelCallBack;

  void execute() async {
    print("bill_pay_usecase (19): in usecase execute method");
    _scope =
        ExampleLocator().repository.containsScope<BillPayEntity>();
    if (_scope == null) {
      _scope = ExampleLocator().repository.create<BillPayEntity>(
          new BillPayEntity(), _notifySubscribers);

      await ExampleLocator()
          .repository
          .runServiceAdapter(_scope!, BillPayServiceAdapter());
    } else {
      _scope!.subscription = _notifySubscribers;
    }
  }

  void _notifySubscribers(entity) {
    _viewModelCallBack(buildViewModel(entity));
  }

  BillPayViewModel buildViewModel(BillPayEntity entity, {int selectedBillIndex = -1}) {
    if (entity.hasErrors()) {
      return BillPayViewModel(
        allBills: entity.allBills!,
        selectedBillIndex: selectedBillIndex,
        serviceResponseStatus: ServiceResponseStatus.failed,
      );
    } else {
      return BillPayViewModel(
        allBills: entity.allBills!,
        selectedBillIndex: selectedBillIndex,
        serviceResponseStatus: ServiceResponseStatus.succeed,
      );
    }
  }

  void updateSelectedBillIndex(int selectedBillIndex) {
    print("bill_pay_usecase (55): in usecase $selectedBillIndex");
    if (_scope == null) {
      _scope = ExampleLocator().repository.create<BillPayEntity>(
          new BillPayEntity(), _notifySubscribers);
    }

    final entity = ExampleLocator().repository.get<BillPayEntity>(_scope!);
    _viewModelCallBack(buildViewModel(entity, selectedBillIndex: selectedBillIndex));
  }

  void payBill() {
    //TODO: add functionality
  }
}
