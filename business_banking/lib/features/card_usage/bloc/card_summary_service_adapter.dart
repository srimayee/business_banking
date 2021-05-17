import 'package:business_banking/features/card_usage/api/transaction_service.dart';
import 'package:business_banking/features/card_usage/api/transaction_service_response_model_list.dart';

import 'package:business_banking/features/card_usage/model/card_summary_entity.dart';
import 'package:business_banking/features/card_usage/model/card_summary_model.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework/clean_framework_defaults.dart';

class CardSummaryServiceAdapter extends ServiceAdapter<CardSummaryEntity,
    JsonRequestModel, TransactionServiceResponseModelList, TransactionService> {
  CardSummaryServiceAdapter() : super(TransactionService());

  @override
  CardSummaryEntity createEntity(CardSummaryEntity initialEntity,
      TransactionServiceResponseModelList responseModelList) {
    return CardSummaryEntity(
        transactionDetails: responseModelList
            .transactionDetailEntityModelResponseList
            .map((transactionDetailEntityModelResponse) => CardSummaryModel(
                transactionTitle:
                    transactionDetailEntityModelResponse.transactionTitle,
                transactionCategory:
                    transactionDetailEntityModelResponse.transactionCategory,
                transactionAmount: double.parse(
                    transactionDetailEntityModelResponse.transactionAmount),
                transactionId:
                    transactionDetailEntityModelResponse.transactionId,
                payTo: transactionDetailEntityModelResponse.payTo,
                debit: transactionDetailEntityModelResponse.debit,
                date: DateTime.fromMillisecondsSinceEpoch(
                    transactionDetailEntityModelResponse.timestamp * 1000)))
            .toList());
  }
}
