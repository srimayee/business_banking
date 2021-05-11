import 'package:clean_framework/clean_framework.dart';
import 'package:business_banking/features/deposit_check/model/enums.dart';

import '../bill.dart';

class BillPayViewModel extends ViewModel {
  final List<Bill> allBills;
  final selectedBillIndex;
  final serviceResponseStatus;

  BillPayViewModel(
      {required this.allBills,
        this.serviceResponseStatus = ServiceResponseStatus.unknown,
        this.selectedBillIndex = -1});

  @override
  List<Object> get props => [allBills];
}
