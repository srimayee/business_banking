import 'package:business_banking/features/transfer_funds/enums.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:equatable/equatable.dart';

class TransferConfirmationViewModel extends Equatable implements ViewModel {
  final String fromAccount;
  final String toAccount;
  final double amount;
  final DateTime date;
  final String id;
  final serviceStatus;
  final dataStatus;

  TransferConfirmationViewModel({
    this.fromAccount,
    this.toAccount,
    this.amount = 0,
    this.date,
    this.id,
    this.dataStatus = DataStatus.unknown,
    this.serviceStatus = ServiceStatus.unknown
  });

  @override
  List<Object> get props => [fromAccount, toAccount, amount, date, id];

  @override
  String toString() {
    return "$fromAccount $toAccount $amount $date $id $dataStatus $serviceStatus";
  }
}