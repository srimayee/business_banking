import 'package:business_banking/features/budget/model/account_info.dart';
import 'package:business_banking/features/budget/model/posted_transactions.dart';
import 'package:clean_framework/clean_framework_defaults.dart';

class TransactionsJsonResponseModel implements JsonResponseModel {
  final AccountInfo accountInfo;
  final List<PostedTransactions> allTransactions;

  TransactionsJsonResponseModel(this.accountInfo, this.allTransactions);

  TransactionsJsonResponseModel.fromJson(Map<String, dynamic> json)
      : accountInfo = AccountInfo.fromJson(json["accountInfo"]),
        allTransactions = (json["postedTransactions"] as List)
            .map((i) => new PostedTransactions.fromJson(i))
            .toList();

  @override
  // implement props
  List<Object> get props => [accountInfo, allTransactions];

  @override
  // implement stringify
  bool get stringify => false;
}
