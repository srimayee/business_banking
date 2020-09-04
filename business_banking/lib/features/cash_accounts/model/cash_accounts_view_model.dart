import 'package:clean_framework/clean_framework.dart';

class CashAccountsViewModel extends ViewModel {
  final String name;
  final String lastFour;
  final double balance;
  
  CashAccountsViewModel({
    this.name,
    this.lastFour,
    this.balance
  }) : assert(name != null &&
              lastFour != null &&
              balance != null);
}