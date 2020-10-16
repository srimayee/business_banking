import 'package:clean_framework/clean_framework_defaults.dart';
import 'package:equatable/equatable.dart';

class TransferFundsRequestModel extends Equatable implements JsonRequestModel {
  final String fromAccount;
  final String toAccount;
  final String amount;
  final DateTime date;

  TransferFundsRequestModel(
      {this.fromAccount,
        this.toAccount,
        this.amount,
        this.date
      });

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