import 'package:clean_framework/clean_framework.dart';
import 'package:business_banking/features/cash_accounts/model/entity.dart';
import 'package:business_banking/features/cash_accounts/api/service.dart';
import 'package:business_banking/features/cash_accounts/api/service_response_model.dart';
import 'package:clean_framework/clean_framework_defaults.dart';

class CashAccountsServiceAdapter extends ServiceAdapter<CashAccountsEntity,
    JsonRequestModel, CashAccountsServiceResponseModel, CashAccountsService> {
  CashAccountsServiceAdapter() : super(CashAccountsService());

  @override
  CashAccountsEntity createEntity(CashAccountsEntity initialEntity,
      CashAccountsServiceResponseModel responseModel) {
    return CashAccountsEntity(

        /// Link Response Model to cash_accounts_entity_fields
        accountType: responseModel.accountType,
        accountTitle: responseModel.accountTitle,
        accountNumber: responseModel.accountNumber,
        accountBalance: responseModel.accountBalance,
        accountStatus: responseModel.accountStatus);
  }
}
