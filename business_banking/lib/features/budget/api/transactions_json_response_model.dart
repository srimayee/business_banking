import 'package:business_banking/features/budget/model/posted_transactions.dart';
import 'package:clean_framework/clean_framework_defaults.dart';

class TransactionsJsonResponseModel extends JsonResponseModel {
  final List<PostedTransactions> allTransactions;

  TransactionsJsonResponseModel(this.allTransactions);

  TransactionsJsonResponseModel.fromJson(Map<String, dynamic> json)
      : allTransactions = (json["postedTransactions"] as List)
            .map((i) => new PostedTransactions.fromJson(i))
            .toList();

  @override
  // implement props
  List<Object?> get props => [allTransactions];

  @override
  // implement stringify
  bool get stringify => false;
}
