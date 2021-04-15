// import 'package:business_banking/features/transfer_funds/api/accounts/transfer_accounts_from_response_model.dart';
// import 'package:business_banking/features/transfer_funds/api/accounts/transfer_accounts_from_service.dart';
// import 'package:business_banking/features/transfer_funds/model/transfer_entity.dart';
// import 'package:clean_framework/clean_framework.dart';
// import 'package:clean_framework/clean_framework_defaults.dart';

// class TransferFundsAccountsFromServiceAdapter extends ServiceAdapter<
//     TransferFundsEntity,
//     JsonRequestModel,
//     TransferFundsAccountsFromResponseModel,
//     TransferFundsAccountsFromService> {
//   TransferFundsAccountsFromServiceAdapter() : super(TransferFundsAccountsFromService());

//   @override
//   TransferFundsEntity createEntity(
//       TransferFundsEntity initialEntity,
//       TransferFundsAccountsFromResponseModel responseModel) {
//     return initialEntity.merge(errors: <EntityFailure>[], fromAccounts: responseModel.fromAccounts) as TransferFundsEntity;
//   }
// }
