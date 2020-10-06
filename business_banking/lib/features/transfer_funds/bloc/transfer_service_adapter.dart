import 'package:business_banking/features/transfer_funds/api/transfer_request_model.dart';
import 'package:business_banking/features/transfer_funds/api/transfer_response_model.dart';
import 'package:business_banking/features/transfer_funds/api/transfer_service.dart';
import 'package:business_banking/features/transfer_funds/model/transfer_entity.dart';
import 'package:clean_framework/clean_framework.dart';

class TransferFundsServiceAdapter extends ServiceAdapter<
    TransferFundsEntity,
    TransferFundsRequestModel,
    TransferFundsResponseModel,
    TransferFundsService> {
  TransferFundsServiceAdapter() : super(TransferFundsService());

  @override
  TransferFundsRequestModel createRequest(TransferFundsEntity entity) {
    TransferFundsRequestModel model = TransferFundsRequestModel(
        fromAccount: entity.fromAccount,
        toAccount: entity.toAccount,
        amount: entity.amount,
        date: entity.date);
    // return TransferFundsRequestModel(
    //     //     fromAccount: entity.fromAccount,
    //     //     toAccount: entity.toAccount,
    //     //     amount: entity.amount,
    //     //     date: entity.date);
    print('model created by TransferServiceAdapter: ${model.fromAccount}, ${model.toAccount}, ${model.amount}, ${model.date}');
    return model;
  }

  @override
  TransferFundsEntity createEntity(TransferFundsEntity initialEntity,
      TransferFundsResponseModel responseModel) {
    print('TransferServiceAdapter creating Entity');
    return initialEntity
        .merge(errors: <EntityError>[], id: responseModel.confirmation);
  }
}
