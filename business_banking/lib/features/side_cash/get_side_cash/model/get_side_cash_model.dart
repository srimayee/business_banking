import 'package:clean_framework/clean_framework.dart';

class GetSideCashEntity extends Entity {
  final String amountRequested;
  final String failError;

  GetSideCashEntity(
      {List<EntityFailure> errors = const [],
      this.amountRequested,
      this.failError})
      : super(errors: errors);

  @override
  List<Object> get props => [amountRequested, failError, errors];

  @override
  merge({errors, String amountRequested}) {
    return GetSideCashEntity(
        errors: errors, amountRequested: amountRequested, failError: failError);
  }
}
