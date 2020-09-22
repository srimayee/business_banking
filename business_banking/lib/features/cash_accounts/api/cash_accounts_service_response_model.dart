import 'package:clean_framework/clean_framework_defaults.dart';
import 'package:equatable/equatable.dart';

class CashAccountsServiceResponseModel extends Equatable
    implements JsonResponseModel {
  /// Rest API Accounts Object.
  final String accountTitle;
  final String accountNumber;
  final double accountBalance;
  final String accountStatus;

  CashAccountsServiceResponseModel.fromJson(Map<String, dynamic> json)
      : accountTitle = json['accountTitle'] ?? 'Checking Account',
        accountNumber = json['accountNumber'] ?? '0000',
        accountBalance = json['accountBalance'] ?? 0.00,
        accountStatus = json['accountStatus'] ?? 'Active';

  @override
  List<Object> get props =>
      [accountTitle, accountNumber, accountBalance, accountStatus];
}
