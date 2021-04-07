import 'package:clean_framework/clean_framework_defaults.dart';
import 'package:equatable/equatable.dart';

class TransactionDetailsServiceResponseModel extends Equatable
    implements JsonResponseModel {
  final String transactionTitle;
  final String transactionCategory;
  final String transactionAmount;
  final String transactionId;

  TransactionDetailsServiceResponseModel.fromJson(Map<String, dynamic> json)
      : transactionTitle = json['transactionTitle'],
        transactionCategory = json['transactionCategory'] ?? '0',
        transactionAmount = json['transactionAmount'],
        transactionId = json['transactionId'] ?? '000000000';

  @override
  List<Object> get props => [
        transactionTitle,
        transactionCategory,
        transactionAmount,
        transactionId,
      ];
}
