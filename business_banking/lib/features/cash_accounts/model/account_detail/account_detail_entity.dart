import 'package:business_banking/features/cash_accounts/model/account_detail/account_detail_transaction_holds_model.dart';
import 'package:clean_framework/clean_framework.dart';

import 'account_detail_transaction_details_model.dart';

class AccountDetailEntity extends Entity {
  final String transactionTitle;
  final String transactionNumber;
  final String transactionAmount;
  final String transactionId;
  final List<TransactionDetailsModel> transactionDetails;
  final List<TransactionHoldsModel> transactionHolds;

  AccountDetailEntity({
    List<EntityError> errors = const [],
    String transactionTitle,
    String transactionNumber,
    String transactionAmount,
    String transactionId,
    List<TransactionDetailsModel> transactionDetails,
    List<TransactionHoldsModel> transactionHolds,
  })  : transactionTitle = transactionTitle,
        transactionNumber = transactionNumber ?? '0',
        transactionAmount = transactionAmount ?? '0.00',
        transactionId = transactionId ?? '000000000',
        transactionDetails = transactionDetails,
        transactionHolds = transactionHolds,
        super(errors: errors);

  @override
  List<Object> get props => [
        errors,
        transactionTitle,
        transactionNumber,
        transactionAmount,
        transactionId,
        transactionDetails,
        transactionHolds
      ];

  @override
  merge(
      {errors,
      String transactionTitle,
      String transactionNumber,
      String transactionAmount,
      String transactionId,
      List<TransactionDetailsModel> transactionDetails,
      List<TransactionHoldsModel> transactionHolds}) {
    return AccountDetailEntity(
        errors: errors ?? this.errors,
        transactionTitle: transactionTitle ?? this.transactionTitle,
        transactionNumber: transactionNumber ?? this.transactionNumber,
        transactionAmount: transactionAmount ?? this.transactionAmount,
        transactionId: transactionId ?? this.transactionId,
        transactionDetails: transactionDetails ?? this.transactionDetails,
        transactionHolds: transactionHolds ?? this.transactionHolds);
  }

  @override
  String toString() {
    return '$transactionTitle '
        '$transactionNumber '
        '$transactionAmount '
        '$transactionId '
        '$transactionDetails '
        '$transactionHolds ';
  }
}
