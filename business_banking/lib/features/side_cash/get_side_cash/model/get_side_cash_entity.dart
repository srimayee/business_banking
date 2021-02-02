import 'package:clean_framework/clean_framework.dart';

class GetSideCashEntity extends Entity {
  final String amountRequested;
  final String failError;
  final String badStringError;
  final bool requestSuccess;

  GetSideCashEntity({
    List<EntityFailure> errors = const [],
    this.amountRequested,
    this.failError,
    this.badStringError,
    this.requestSuccess,
  }) : super(errors: errors);

  @override
  List<Object> get props =>
      [amountRequested, failError, errors, badStringError, requestSuccess];

  @override
  merge({errors, String amount, String badString, bool success}) {
    return GetSideCashEntity(
      errors: errors,
      amountRequested: amount,
      failError: failError,
      badStringError: badString,
      requestSuccess: success,
    );
  }
}
