import 'package:business_banking/features/card_usage/model/card_summary_model.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';

class CardSummaryViewModel extends ViewModel {
  final List<CardSummaryModel> cardTransactions;

  CardSummaryViewModel({required this.cardTransactions})
      : assert(cardTransactions != null);

  @override
  List<Object> get props => [cardTransactions];
}
