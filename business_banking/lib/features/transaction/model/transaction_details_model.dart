import 'package:clean_framework/clean_framework.dart';

class TransactionDetailsModel extends ViewModel {
  final String transactionTitle;
  final String transactionCategory;
  final String transactionAmount;
  final String transactionId;

  TransactionDetailsModel(
      {this.transactionTitle,
      this.transactionCategory,
      this.transactionAmount,
      this.transactionId})
      : assert(transactionTitle != null &&
            transactionCategory != null &&
            transactionAmount != null &&
            transactionId != null);

  @override
  List<Object> get props =>
      [transactionTitle, transactionCategory, transactionAmount, transactionId];
}
