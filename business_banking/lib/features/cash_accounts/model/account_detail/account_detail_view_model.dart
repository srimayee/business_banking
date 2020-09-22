import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';

import 'account_detail_transaction_details_model.dart';
import 'account_detail_transaction_holds_model.dart';

class AccountDetailViewModel extends ViewModel {
  final String transactionTitle;
  final String transactionNumber;
  final String transactionAmount;
  final String transactionId;
  final TransactionDetails transactionDetails;
  final TransactionHolds transactionHolds;

  AccountDetailViewModel(
      {@required this.transactionTitle,
      @required this.transactionNumber,
      @required this.transactionAmount,
      @required this.transactionId,
      @required this.transactionDetails,
      @required this.transactionHolds});
}
