import 'package:clean_framework/clean_framework_defaults.dart';

class TransferFundsRequestModel extends JsonRequestModel {
  final String fromAccount;
  final String toAccount;
  final String amount;
  final DateTime date;

  TransferFundsRequestModel(
      {required this.fromAccount,
      required this.toAccount,
      required this.amount,
      required this.date});

  @override
  Map<String, dynamic> toJson() {
    return {
      'fromAccount': fromAccount,
      'toAccount': toAccount,
      'amount': amount,
      'date': date.toIso8601String()
    };
  }

  @override
  List<Object> get props => [fromAccount, toAccount, amount, date];
}
