import 'package:business_banking/features/transfer_funds/api/accounts/transfer_accounts_to_request_model.dart';
import 'package:business_banking/features/transfer_funds/api/accounts/transfer_accounts_to_response_model.dart';
import 'package:business_banking/features/transfer_funds/api/accounts/transfer_accounts_to_service.dart';
import 'package:business_banking/features/transfer_funds/model/transfer_entity.dart';
import 'package:clean_framework/clean_framework.dart';

class TransferFundsAccountsToServiceAdapter extends ServiceAdapter<
    TransferFundsEntity,
    TransferFundsAccountsToRequestModel,
    TransferFundsAccountsToResponseModel,
    TransferFundsAccountsToService> {
  TransferFundsAccountsToServiceAdapter()
      : super(TransferFundsAccountsToService());

  @override
  TransferFundsAccountsToRequestModel createRequest(
      TransferFundsEntity entity) {
    return TransferFundsAccountsToRequestModel(fromAccount: entity.fromAccount);
  }

  @override
  TransferFundsEntity createEntity(TransferFundsEntity initialEntity,
      TransferFundsAccountsToResponseModel responseModel) {
    return initialEntity.merge(
        errors: <EntityFailure>[],
        toAccounts: responseModel.toAccounts) as TransferFundsEntity;
  }
}
