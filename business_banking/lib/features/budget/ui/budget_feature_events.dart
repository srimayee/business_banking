import 'package:equatable/equatable.dart';

abstract class BudgetEvent extends Equatable {}

class ApplyFilter implements BudgetEvent {
  final String value;

  ApplyFilter(this.value);

  @override
  // props
  List<Object?> get props => [value];

  @override
  // stringify
  bool? get stringify => true;
}

class SelectAccount implements BudgetEvent {
  final int value;

  SelectAccount(this.value);

  @override
  // props
  List<Object?> get props => [value];

  @override
  // stringify
  bool? get stringify => true;
}
