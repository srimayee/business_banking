import 'package:clean_framework/clean_framework.dart';

class CashAccountsViewModel extends ViewModel {
  final String accountName;
  final int accountLastFour;
  final double accountBalance;
  
  CashAccountsViewModel({
    this.accountName,
    this.accountLastFour,
    this.accountBalance
  }) : assert(accountName != null &&
              accountLastFour != null &&
              accountBalance != null);
}