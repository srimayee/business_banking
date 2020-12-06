import 'package:clean_framework/clean_framework.dart';

class MortgageEntity extends Entity {
  final DateTime monthlyPaymentDue;
  final double monthlyAmountDue;
  final double outstandingPrincipal;
  final double interestRate;

  MortgageEntity(
      {List<EntityFailure> errors = const [],
      DateTime monthlyPaymentDue,
      double monthlyAmountDue,
      double outstandingPrincipal,
      double interestRate})
      : monthlyPaymentDue = monthlyPaymentDue ?? DateTime.now(),
        monthlyAmountDue = monthlyAmountDue ?? 0.00,
        outstandingPrincipal = outstandingPrincipal ?? 0.00,
        interestRate = interestRate,
        super(errors: errors);

  @override
  List<Object> get props => [
        errors,
        monthlyAmountDue,
        monthlyPaymentDue,
        outstandingPrincipal,
        interestRate
      ];

  @override
  merge({
    errors,
    DateTime monthlyPaymentDue,
    double monthlyAmountDue,
    double outstandingPrincipal,
    double intrestRate,
  }) {
    return MortgageEntity(
      errors: errors ?? this.errors,
      monthlyPaymentDue: monthlyPaymentDue ?? this.monthlyPaymentDue,
      outstandingPrincipal: outstandingPrincipal ?? this.outstandingPrincipal,
      monthlyAmountDue: monthlyAmountDue ?? this.monthlyAmountDue,
    );
  }
}
