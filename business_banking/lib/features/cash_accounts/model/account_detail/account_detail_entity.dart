import 'package:business_banking/features/cash_accounts/model/account_detail/account_detail_transaction_holds_model.dart';
import 'package:clean_framework/clean_framework.dart';

import 'account_detail_transaction_details_model.dart';

/// The AccountDetailEntityModel is the main model utilized for presenting the
/// Account Detail cards. This model is linked to the Account Details
/// Transaction Detail Model and the Account Details Transaction Holds Model.
class AccountDetailEntityModel extends Entity {
  final String transactionTitle;
  final String transactionNumber;
  final String transactionAmount;
  final String transactionId;
  final List<AccountDetailTransactionDetailsModel> transactionDetails;
  final List<AccountDetailsTransactionHoldsModel> transactionHolds;

  AccountDetailEntityModel({
    List<EntityError> errors = const [],
    String transactionTitle,
    String transactionNumber,
    String transactionAmount,
    String transactionId,
    List<AccountDetailTransactionDetailsModel> transactionDetails,
    List<AccountDetailsTransactionHoldsModel> transactionHolds,
  })  : transactionTitle = transactionTitle,
        transactionNumber = transactionNumber ?? '0',
        transactionAmount = transactionAmount ?? '0.00',
        transactionId = transactionId ?? '000000000',
        transactionDetails = transactionDetails,
        transactionHolds = transactionHolds,
        super(errors: errors);

  AccountDetailEntityModel.fromJson(Map<String, dynamic> json)
      :
        /// Assign JSON values
        transactionTitle = json['transactionTitle'],
        transactionNumber = json['transactionNumber'],
        transactionAmount = json['transactionAmount'],
        transactionId = json['transactionId'],

        /// Parse JSON object response to appropriate Entity Model Types
        transactionDetails = List<AccountDetailTransactionDetailsModel>.from(
              json['transactionDetails']?.map((cashAccountsJSONObject) =>
                  AccountDetailTransactionDetailsModel.fromJson(
                      cashAccountsJSONObject)),
            ) ?? [],

        /// Parse JSON object response to appropriate Entity Model Types
        transactionHolds= List<AccountDetailsTransactionHoldsModel>.from(
          json['transactionHolds']?.map((cashAccountsJSONObject) =>
              AccountDetailsTransactionHoldsModel.fromJson(
                  cashAccountsJSONObject)),
        ) ?? [];

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
      List<AccountDetailTransactionDetailsModel> transactionDetails,
      List<AccountDetailsTransactionHoldsModel> transactionHolds}) {
    return AccountDetailEntityModel(
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
