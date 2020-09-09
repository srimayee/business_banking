import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';

class AccountDetailViewModel extends ViewModel {
  final String name;
  final String lastFour;
  final String accountType;
  final int routingNumber;
  final double balance;
  final double beginningBalance;
  final double pendingTransactions;
  final double depositHolds;
  
  AccountDetailViewModel({
    @required this.name,
    @required this.lastFour,
    @required this.accountType,
    @required this.routingNumber,
    @required this.balance,
    @required this.beginningBalance,
    @required this.pendingTransactions,
    @required this.depositHolds
  }) : assert(name != null &&
              lastFour != null &&
              accountType != null &&
              routingNumber != null &&
              balance != null &&
              beginningBalance != null &&
              pendingTransactions != null &&
              depositHolds != null);
}
