import 'package:business_banking/features/transaction_detail/api/transaction_details_service.dart';
import 'package:business_banking/features/transaction_detail/api/transaction_details_service_response_model_list.dart';
import 'package:business_banking/features/transaction_detail/model/transaction_details_entity.dart';
import 'package:business_banking/features/transaction_detail/model/transaction_details_model.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework/clean_framework_defaults.dart';

class TransactionDetailsServiceAdapter extends ServiceAdapter<
    TransactionDetailsEntity,
    JsonRequestModel,
    TransactionDetailServiceResponseModelList,
    TransactionDetailsService> {
  TransactionDetailsServiceAdapter() : super(TransactionDetailsService());

  @override
  TransactionDetailsEntity createEntity(TransactionDetailsEntity initialEntity,
      TransactionDetailServiceResponseModelList responseModelList) {
    return TransactionDetailsEntity(
        transactionDetails: responseModelList
            .transactionDetailEntityModelResponseList
            .map((transactionDetailEntityModelResponse) =>
                TransactionDetailsModel(
                    transactionTitle:
                        transactionDetailEntityModelResponse.transactionTitle,
                    transactionCategory: transactionDetailEntityModelResponse
                        .transactionCategory,
                    transactionAmount:
                        transactionDetailEntityModelResponse.transactionAmount,
                    transactionId:
                        transactionDetailEntityModelResponse.transactionId))
            .toList());
  }
}
