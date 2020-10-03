import 'package:business_banking/features/transfer_funds/enums.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';

class TransferFundsViewModel extends ViewModel {
  final String fromAccount;
  final String toAccount;
  final double amount;
  final DateTime date;
  final List<String> fromAccounts;
  final List<String> toAccounts;
  final String id;
  final serviceStatus;
  final dataStatus;

  TransferFundsViewModel({
    @required this.fromAccount,
    @required this.toAccount,
    @required this.amount,
    @required this.date,
    @required this.fromAccounts,
    @required this.toAccounts,
    this.id,
    this.dataStatus = DataStatus.unknown,
    this.serviceStatus = ServiceStatus.unknown
  });
}