import 'package:clean_framework/clean_framework.dart';

import '../bill.dart';

class BillPayEntity extends Entity {
  final List<Bill>? allBills;
  final int? selectedBillIndex;
  final bool? didSucceed;
  final String? referenceNumber;

  BillPayEntity({
    List<EntityFailure> errors = const [],
    List<Bill>? allBills,
    int? selectedBillIndex,
    bool? didSucceed,
    String? referenceNumber,
  })  : allBills = allBills ?? [],
        selectedBillIndex = selectedBillIndex ?? -1,
        didSucceed = didSucceed ?? false,
        referenceNumber = referenceNumber ?? '',
        super(errors: errors);

  @override
  List<Object> get props => [
    errors,
    allBills!,
    selectedBillIndex!,
    didSucceed!,
    referenceNumber!
  ];

  @override
  BillPayEntity merge({
    List<EntityFailure>? errors,
    List<Bill>? allBills,
    int? selectedBillIndex,
    bool? didSucceed,
    String? referenceNumber
  }) {
    return BillPayEntity(
      errors: errors ?? this.errors,
      allBills: allBills ?? this.allBills,
      selectedBillIndex: selectedBillIndex ?? this.selectedBillIndex,
      didSucceed: didSucceed ?? this.didSucceed,
      referenceNumber: referenceNumber ?? this.referenceNumber
    );
  }
}
