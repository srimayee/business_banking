import 'package:clean_framework/clean_framework.dart';
import 'package:equatable/equatable.dart';

class SideCashDetailsViewModel extends Equatable implements ViewModel {
  final String grossSideCashBalance;
  final String interest;
  final String paymentMin;
  final String remainingCredit;

  SideCashDetailsViewModel({
    this.grossSideCashBalance,
    this.interest,
    this.paymentMin,
    this.remainingCredit,
  });

  @override
  List<Object> get props => [
        this.grossSideCashBalance,
        this.interest,
        this.paymentMin,
        this.remainingCredit
      ];
}
