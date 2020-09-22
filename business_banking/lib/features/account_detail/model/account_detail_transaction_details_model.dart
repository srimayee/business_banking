import 'package:flutter/material.dart';

class TransactionDetails {
  final String transactionInitiator;
  final String transactionAlias;
  final String initiatorAddress;
  final String transactionTimestamp;
  final String transactionInitiationDate;
  final String transactionPostDate;

  TransactionDetails({
    @required this.transactionInitiator,
    @required this.transactionAlias,
    @required this.initiatorAddress,
    @required this.transactionTimestamp,
    @required this.transactionInitiationDate,
    @required this.transactionPostDate,
  }) : assert(transactionInitiator != null &&
            transactionAlias != null &&
            initiatorAddress != null &&
            transactionTimestamp != null &&
            transactionInitiationDate != null &&
            transactionPostDate != null);
}
