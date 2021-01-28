import 'package:clean_framework/clean_framework.dart';

class GetSideCashEntity extends Entity {
  final String amountRequested;

  GetSideCashEntity(
      {List<EntityFailure> errors = const [], this.amountRequested})
      : super(errors: errors);

  @override
  List<Object> get props => [amountRequested, errors];

  @override
  merge({errors, String amountRequested}) {
    return GetSideCashEntity(errors: errors, amountRequested: amountRequested);
  }
}
