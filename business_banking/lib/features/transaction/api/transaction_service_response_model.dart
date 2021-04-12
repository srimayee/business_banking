import 'package:clean_framework/clean_framework_defaults.dart';
import 'package:equatable/equatable.dart';

class TransactionServiceResponseModel extends Equatable
    implements JsonResponseModel {
  final String transactionTitle;
  final String transactionCategory;
  final String transactionAmount;
  final String transactionId;
  final String payTo;
  final int timestamp;

  TransactionServiceResponseModel.fromJson(Map<String, dynamic> json)
      : transactionTitle = json['transactionTitle'] ?? '',
        transactionCategory = json['transactionCategory'] ?? '0',
        transactionAmount = json['transactionAmount'] ?? '0.00',
        payTo = json['payTo'] ?? '',
        timestamp = json['timestamp'] ?? 1618237756,
        transactionId = json['transactionId'] ?? '000000000';

  @override
  List<Object> get props => [
        transactionTitle,
        transactionCategory,
        transactionAmount,
        transactionId,
        payTo,
        timestamp
      ];
}
