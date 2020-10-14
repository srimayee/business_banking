import 'package:business_banking/features/transfer_funds/enums.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:equatable/equatable.dart';

class TransferFundsViewModel extends Equatable implements ViewModel {
  final String fromAccount;
  final String toAccount;
  final double amount;
  final DateTime date;
  final List<String> fromAccounts;
  final List<String> toAccounts;
  final String id;
  final serviceStatus;
  final dataStatus;

  TransferFundsViewModel(
      {this.fromAccount,
      this.toAccount,
      this.amount = 0,
      this.date,
      this.fromAccounts,
      this.toAccounts,
      this.id,
      this.dataStatus = DataStatus.unknown,
      this.serviceStatus = ServiceStatus.unknown});

  @override
  List<Object> get props =>
      [fromAccount, toAccount, amount, fromAccounts, toAccounts, id];

  @override
  String toString() {
    return "fromAccount: $fromAccount, toAccount: $toAccount, amount: $amount, date: $date, fromAccounts: $fromAccounts, toAccounts: $toAccounts, id: $id, dataStatus: $dataStatus, serviceStatus: $serviceStatus";
  }
}
