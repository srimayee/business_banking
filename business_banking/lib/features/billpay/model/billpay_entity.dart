import 'package:clean_framework/clean_framework.dart';

class BillPayEntity extends Entity {
  final double amount;

  BillPayEntity({
    List<EntityError> errors = const [],
    this.amount = 0.00,
  }) : super(errors: errors);

  @override
  List<Object> get props => [
        amount,
      ];

  @override
  merge({errors, double amount}) {
    return BillPayEntity(
      amount: amount ?? this.amount,
    );
  }

  @override
  String toString() {
    return '$amount';
  }
}
