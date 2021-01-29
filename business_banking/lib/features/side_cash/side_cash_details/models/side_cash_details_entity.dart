import 'package:clean_framework/clean_framework.dart';

class SideCashDetailsEntity extends Entity {
  final String grossSideCashBalance;
  final String interest;
  final String paymentMin;
  final String remainingCredit;

  SideCashDetailsEntity({
    List<EntityFailure> errors = const [],
    this.grossSideCashBalance,
    this.interest,
    this.paymentMin,
    this.remainingCredit,
  }) : super(errors: errors);

  @override
  List<Object> get props =>
      [grossSideCashBalance, interest, paymentMin, remainingCredit, errors];

  @override
  merge({errors, String amountRequested}) {
    return SideCashDetailsEntity(
      errors: errors,
      grossSideCashBalance: grossSideCashBalance,
      interest: interest,
      paymentMin: paymentMin,
      remainingCredit: remainingCredit,
    );
  }
}
