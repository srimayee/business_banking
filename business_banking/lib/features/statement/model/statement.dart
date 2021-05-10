import 'package:business_banking/features/deposit_check/model/account_info_struct.dart';
import 'package:business_banking/features/statement/model/statement_info.dart';

class Statement {
  final AccountInfoStruct accountInfo;
  final List<StatementActivity> statementActivity;

  Statement({required this.accountInfo, required this.statementActivity});

  Statement.fromJson(Map<String, dynamic> json)
      : accountInfo = json['accountInfo'] != null
            ? AccountInfoStruct.fromJson(json['accountInfo'])
            : AccountInfoStruct(),
        statementActivity = json['statementActivity'] != null
            ? (json["statementActivity"] as List)
                .map((i) => new StatementActivity.fromJson(i))
                .toList()
            : [];
}
