import 'package:clean_framework/clean_framework.dart';

import 'package:business_banking/features/deposit_check/model/enums.dart';

class BillPayCardViewModel extends ViewModel {
  final int billsDue;
  final serviceResponseStatus;

  BillPayCardViewModel(
      {required this.billsDue,
        this.serviceResponseStatus = ServiceResponseStatus.unknown});

  @override
  List<Object> get props => [billsDue, serviceResponseStatus];
}
