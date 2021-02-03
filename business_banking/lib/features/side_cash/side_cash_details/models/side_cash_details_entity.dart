import 'package:clean_framework/clean_framework.dart';

class SideCashDetailsEntity extends Entity {
  final String grossSideCashBalance;
  final String interest;
  final String paymentMin;
  final String remainingCredit;
  final bool detailsOpen;

  SideCashDetailsEntity({
    List<EntityFailure> errors = const [],
    this.grossSideCashBalance,
    this.interest,
    this.paymentMin,
    this.remainingCredit,
    this.detailsOpen,
  }) : super(errors: errors);

  @override
  List<Object> get props => [
        grossSideCashBalance,
        interest,
        paymentMin,
        remainingCredit,
        detailsOpen,
        errors
      ];

  @override
  merge({errors, bool isOpen}) {
    return SideCashDetailsEntity(
      errors: errors,
      grossSideCashBalance: this.grossSideCashBalance ?? '',
      interest: this.interest ?? '',
      paymentMin: this.paymentMin ?? '',
      remainingCredit: this.remainingCredit ?? '',
      detailsOpen: isOpen,
    );
  }
}
