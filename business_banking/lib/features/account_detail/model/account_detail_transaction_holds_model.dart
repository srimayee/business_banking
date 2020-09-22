import 'package:flutter/material.dart';

class TransactionHolds {
  final String holdTitle;
  final String holdInitiationDate;
  final String holdInitiator;
  final String holdDescription;
  final String holdAmount;

  TransactionHolds(
      {@required this.holdTitle,
      @required this.holdInitiationDate,
      @required this.holdInitiator,
      @required this.holdDescription,
      @required this.holdAmount})
      : assert(holdTitle != null &&
            holdInitiationDate != null &&
            holdInitiator != null &&
            holdDescription != null &&
            holdAmount != null);
}
