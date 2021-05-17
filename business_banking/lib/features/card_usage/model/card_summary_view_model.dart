import 'package:business_banking/features/card_usage/model/card_summary_model.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';

class CardSummaryViewModel extends ViewModel {
  final List<CardSummaryModel> transactionDetails;

  CardSummaryViewModel({@required this.transactionDetails})
      : assert(transactionDetails != null);

  @override
  List<Object> get props => [transactionDetails];
}
