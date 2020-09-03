import 'package:clean_framework/clean_framework.dart';
import 'package:business_banking/features/cash_accounts/model/cash_accounts_entity.dart';
import 'package:business_banking/features/cash_accounts/api/cash_accounts_service.dart';
import 'package:business_banking/features/cash_accounts/api/cash_accounts_service_response_model.dart';
import 'package:clean_framework/clean_framework_defaults.dart';

class CashAccountsServiceAdapter extends ServiceAdapter<CashAccountsEntity,
    JsonRequestModel, CashAccountsServiceResponseModel, CashAccountsService> {
  CashAccountsServiceAdapter() : super(CashAccountsService());

  @override
  CashAccountsEntity createEntity(
      CashAccountsEntity initialEntity, CashAccountsServiceResponseModel responseModel) {
    return initialEntity.merge(errors: <EntityError>[]);
  }
}