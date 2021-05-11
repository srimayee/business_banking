import 'package:clean_framework/clean_framework.dart';

import '../bill.dart';

class BillPayEntity extends Entity {
  final List<Bill>? allBills;

  BillPayEntity({
    List<EntityFailure> errors = const [],
    List<Bill>? allBills,
  })  : allBills = allBills ?? [],
        super(errors: errors);

  @override
  List<Object> get props => [
    errors,
    allBills!,
  ];

  @override
  BillPayEntity merge({
    List<EntityFailure>? errors,
    List<Bill>? allBills,
  }) {
    return BillPayEntity(
      errors: errors ?? this.errors,
      allBills: allBills ?? this.allBills,
    );
  }
}
