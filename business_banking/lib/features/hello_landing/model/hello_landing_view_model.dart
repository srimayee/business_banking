import 'package:clean_framework/clean_framework.dart';

class HelloLandingViewModel extends ViewModel {
  final String accountName;
  final int accountLastFour;
  final double accountBalance;
  
  HelloLandingViewModel({
    this.accountName,
    this.accountLastFour,
    this.accountBalance
  }) : assert(accountName != null &&
              accountLastFour != null &&
              accountBalance != null);
}