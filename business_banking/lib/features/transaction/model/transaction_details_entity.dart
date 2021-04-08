import 'package:clean_framework/clean_framework.dart';

import 'transaction_details_model.dart';

class TransactionDetailsEntity extends Entity {
  final List<TransactionDetailsModel> transactionDetails;

  TransactionDetailsEntity({
    List<EntityFailure> errors = const [],
    List<TransactionDetailsModel> transactionDetails = const [],
  })  : transactionDetails = transactionDetails,
        super(errors: errors);

  @override
  List<Object> get props => [errors, transactionDetails];

  @override
  merge({errors, String name, String lastFour, double balance}) {
    return TransactionDetailsEntity(
      errors: errors ?? this.errors,
      transactionDetails: transactionDetails ?? this.transactionDetails,
    );
  }
}
