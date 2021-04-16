import 'package:clean_framework/clean_framework_defaults.dart';
import 'package:equatable/equatable.dart';

class TransferFundsAccountsToResponseModel extends JsonResponseModel {
  final List<String> toAccounts;

  TransferFundsAccountsToResponseModel.fromJson(Map<String, dynamic> json)
      : toAccounts = List.from(json['toAccounts']);

  @override
  List<Object> get props => [toAccounts];
}
