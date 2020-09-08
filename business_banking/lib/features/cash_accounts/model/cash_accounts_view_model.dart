import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';

class CashAccountsViewModel extends ViewModel {
  final String name;
  final String lastFour;
  final double balance;
  
  CashAccountsViewModel({
    @required this.name,
    @required this.lastFour,
    @required this.balance
  }) : assert(name != null &&
              lastFour != null &&
              balance != null);
}