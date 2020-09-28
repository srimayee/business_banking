import 'package:business_banking/features/cash_accounts/model/account_detail/account_detail_entity.dart';
import 'package:clean_framework/clean_framework_defaults.dart';
import 'package:equatable/equatable.dart';

class AccountDetailServiceResponseModelList extends Equatable
    implements JsonResponseModel {
  final List<AccountDetailEntityModel> accountDetailEntityModelResponseList;

  AccountDetailServiceResponseModelList.fromJson(Map<String, dynamic> json)
      : accountDetailEntityModelResponseList =
            List<AccountDetailEntityModel>.from(
                  json['accountTransactions']?.map((cashAccountsJSONObject) =>
                      AccountDetailEntityModel.fromJson(cashAccountsJSONObject)),
                ) ??
                [];

  @override
  List<Object> get props => [accountDetailEntityModelResponseList];
}
