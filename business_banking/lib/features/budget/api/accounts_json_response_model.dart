import 'package:business_banking/features/budget/model/account_info.dart';
import 'package:clean_framework/clean_framework_defaults.dart';

class AccountsJsonResponseModel extends JsonResponseModel {
  final List<AccountInfo> accounts;

  AccountsJsonResponseModel(this.accounts);

  AccountsJsonResponseModel.fromJson(Map<String, dynamic> json)
      : accounts = (json["accounts"] as List)
            .map((i) => new AccountInfo.fromJson(i))
            .toList();

  @override
  // implement props
  List<Object?> get props => [accounts];

  @override
  // implement stringify
  bool get stringify => false;
}
