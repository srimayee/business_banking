import 'package:business_banking/features/cash_accounts/api/cash_accounts_service_response_model.dart';
import 'package:business_banking/features/cash_accounts/model/cash_accounts_list_entity.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:business_banking/features/cash_accounts/api/cash_accounts_service.dart';
import 'package:clean_framework/clean_framework_defaults.dart';

class CashAccountsServiceAdapter extends ServiceAdapter<
    CashAccountsEntityModelList,
    JsonRequestModel,
    CashAccountsServiceResponseModel,
    CashAccountsService> {
  CashAccountsServiceAdapter() : super(CashAccountsService());

  @override
  CashAccountsEntityModelList createEntity(
      CashAccountsEntityModelList cashAccountsEntityModelList,
      CashAccountsServiceResponseModel responseModel) {
    return cashAccountsEntityModelList.merge(
        cashAccountEntityModel: responseModel.cashAccountsModelList);
  }
}
