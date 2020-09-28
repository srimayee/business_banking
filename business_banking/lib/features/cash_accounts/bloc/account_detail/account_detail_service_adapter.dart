import 'package:business_banking/features/cash_accounts/api/account_detail/account_detail_service_response_model.dart';
import 'package:business_banking/features/cash_accounts/api/account_detail/account_detail_service_response_model_list.dart';
import 'package:business_banking/features/cash_accounts/model/account_detail/account_detail_list_entity_model.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework/clean_framework_defaults.dart';
import 'package:business_banking/features/cash_accounts/api/account_detail/account_detail_service.dart';

class AccountDetailServiceAdapter extends ServiceAdapter<
    AccountDetailEntityModelList,
    JsonRequestModel,
    AccountDetailServiceResponseModel,
    AccountDetailService> {
  AccountDetailServiceAdapter() : super(AccountDetailService());

  @override
  AccountDetailEntityModelList createEntity(
      AccountDetailEntityModelList accountDetailEntityModelList,
      AccountDetailServiceResponseModelList responseModel) {
    /// Merge the Response Model List to the Entity Model List via the merge function
    /// List<AccountDetailEntityModel> == List<AccountDetailEntityModel>
    return accountDetailEntityModelList.merge(
        accountDetailEntityModel:
            responseModel.accountDetailEntityModelResponseList);
  }
}
