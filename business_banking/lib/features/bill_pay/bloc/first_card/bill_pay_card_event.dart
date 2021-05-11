import 'package:equatable/equatable.dart';

abstract class BillPayCardEvent extends Equatable {}

class UpdateBillsDueEvent implements BillPayCardEvent {
  final int billsDue;

  UpdateBillsDueEvent(this.billsDue);

  @override
  List<Object> get props => [billsDue];

  @override
  bool get stringify => true;
}