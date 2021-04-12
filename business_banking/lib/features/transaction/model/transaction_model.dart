import 'package:clean_framework/clean_framework.dart';

class TransactionModel extends ViewModel {
  final String transactionTitle;
  final String transactionCategory;
  final String transactionAmount;
  final String transactionId;
  final String payTo;
  final DateTime date;

  TransactionModel({
    this.transactionTitle,
    this.transactionCategory,
    this.transactionAmount,
    this.transactionId,
    this.payTo,
    this.date,
  }) : assert(transactionTitle != null &&
            transactionCategory != null &&
            transactionAmount != null &&
            transactionId != null &&
            payTo != null &&
            date != null);

  @override
  List<Object> get props => [
        transactionTitle,
        transactionCategory,
        transactionAmount,
        transactionId,
        payTo,
        date
      ];
}
