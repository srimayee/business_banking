import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework/clean_framework_defaults.dart';
import 'package:business_banking/features/account_detail/model/account_detail_entity.dart';
import 'package:business_banking/features/account_detail/api/account_detail_service.dart';
import 'package:business_banking/features/account_detail/api/account_detail_service_response_model.dart';

class AccountDetailServiceAdapter extends ServiceAdapter<AccountDetailEntity,
    JsonRequestModel, AccountDetailServiceResponseModel, AccountDetailService> {
  AccountDetailServiceAdapter() : super(AccountDetailService());

  @override
  AccountDetailEntity createEntity(AccountDetailEntity initialEntity,
      AccountDetailServiceResponseModel responseModel) {
    return AccountDetailEntity(
        name: responseModel.name,
        lastFour: responseModel.lastFour,
        accountType: responseModel.accountType,
        routingNumber: responseModel.routingNumber,
        balance: responseModel.balance,
        beginningBalance: responseModel.beginningBalance,
        pendingTransactions: responseModel.pendingTransactions,
        depositHolds: responseModel.depositHolds);
  }
}
