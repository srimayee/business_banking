import 'package:clean_framework/clean_framework.dart';

class CardSummaryModel extends ViewModel {
  final String transactionTitle;
  final String transactionCategory;
  final double transactionAmount;
  final String transactionId;
  final String payTo;
  final DateTime date;
  final bool debit;

  CardSummaryModel(
      {this.transactionTitle,
      this.transactionCategory,
      this.transactionAmount,
      this.transactionId,
      this.payTo,
      this.date,
      this.debit})
      : assert(
            transactionTitle != null &&
                transactionCategory != null &&
                transactionAmount != null &&
                transactionId != null &&
                payTo != null &&
                date != null,
            debit != null);

  @override
  List<Object> get props => [
        transactionTitle,
        transactionCategory,
        transactionAmount,
        transactionId,
        payTo,
        date,
        debit
      ];
}
