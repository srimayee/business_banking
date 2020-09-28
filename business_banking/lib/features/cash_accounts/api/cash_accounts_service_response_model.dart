import 'package:business_banking/features/cash_accounts/model/cash_accounts_entity.dart';
import 'package:clean_framework/clean_framework_defaults.dart';
import 'package:equatable/equatable.dart';

class CashAccountsServiceResponseModel extends Equatable
    implements JsonResponseModel {
  /// Rest API Accounts Object.

  final List<CashAccountsEntityModel> cashAccountsModelList;

  CashAccountsServiceResponseModel.fromJson(Map<String, dynamic> json)
      : cashAccountsModelList = List<CashAccountsEntityModel>.from(
              json['accounts']?.map((cashAccountsJSONObject) =>
                  CashAccountsEntityModel.fromJson(cashAccountsJSONObject)),
            ) ??
            [];

  @override
  List<Object> get props => [cashAccountsModelList];
}
