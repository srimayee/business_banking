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
        transactionTitle: responseModel.transactionTitle,
        transactionNumber: responseModel.transactionNumber,
        transactionAmount: responseModel.transactionAmount,
        transactionId: responseModel.transactionId,
        transactionDetails: responseModel.transactionDetails,
        transactionHolds: responseModel.transactionHolds);
  }
}
