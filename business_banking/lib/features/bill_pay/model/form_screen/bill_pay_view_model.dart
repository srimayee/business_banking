import 'package:clean_framework/clean_framework.dart';
import 'package:business_banking/features/deposit_check/model/enums.dart';

import '../bill.dart';

class BillPayViewModel extends ViewModel {
  final List<Bill> allBills;
  final selectedBillIndex;
  final serviceResponseStatus;
  final didSucceed;
  final referenceNumber;

  BillPayViewModel(
      {required this.allBills,
        this.serviceResponseStatus = ServiceResponseStatus.unknown,
        this.selectedBillIndex = -1,
        this.didSucceed = false,
        this.referenceNumber = ''});

  @override
  List<Object> get props => [
    allBills,
    selectedBillIndex,
    serviceResponseStatus,
    didSucceed,
    referenceNumber];
}
