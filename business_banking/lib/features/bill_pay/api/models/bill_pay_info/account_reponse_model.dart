import 'package:clean_framework/clean_framework_defaults.dart';
import 'package:equatable/equatable.dart';

class AccountResponseModel extends Equatable implements JsonResponseModel {
  final String accountTitle;
  final String accountNumber;
  final double accountBalance;
  final String status;

  AccountResponseModel.fromJson(Map<String, dynamic> json)
      : accountTitle = json["account_title"] ?? "Account",
        accountNumber = json["account_number"] ?? "0000",
        accountBalance = (json["account_balance"] as num).toDouble() ?? 0,
        status = json["status"] ?? "Unknown";

  @override
  List<Object> get props => [
        accountTitle,
        accountNumber,
        accountBalance,
        status,
      ];
}
