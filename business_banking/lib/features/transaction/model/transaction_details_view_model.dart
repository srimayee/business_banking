import 'package:business_banking/features/transaction/model/transaction_details_model.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';

class TransactionDetailsViewModel extends ViewModel {
  final List<TransactionDetailsModel> transactionDetails;

  TransactionDetailsViewModel({@required this.transactionDetails})
      : assert(transactionDetails != null);

  @override
  List<Object> get props => [transactionDetails];
}
