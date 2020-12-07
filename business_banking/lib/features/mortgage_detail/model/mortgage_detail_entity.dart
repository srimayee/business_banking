import 'package:clean_framework/clean_framework.dart';

class MortgageDetailEntity extends Entity {
  final double escrowBalance;
  final double feesCharged;
  final int loanNumber;

  MortgageDetailEntity({
    List<EntityFailure> errors = const [],
    double escrowBalance,
    double feesCharged,
    int loanNumber,
  })  : escrowBalance = escrowBalance ?? 0.00,
        feesCharged = feesCharged ?? 0.00,
        loanNumber = loanNumber ?? 0000,
        super(errors: errors);

  @override
  List<Object> get props => [errors, escrowBalance, feesCharged, loanNumber];

  @override
  merge({errors, double escrowBalance, double feesCharged, int loanNumber}) {
    return MortgageDetailEntity(
      errors: errors ?? this.errors,
      escrowBalance: escrowBalance ?? this.escrowBalance,
      feesCharged: feesCharged ?? this.feesCharged,
    );
  }
}
