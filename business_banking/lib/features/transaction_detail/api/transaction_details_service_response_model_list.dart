import 'package:business_banking/features/transaction_detail/api/transaction_detail_service_response_model.dart';
import 'package:clean_framework/clean_framework_defaults.dart';
import 'package:equatable/equatable.dart';

class TransactionDetailServiceResponseModelList extends Equatable
    implements JsonResponseModel {
  final List<TransactionDetailsServiceResponseModel>
      transactionDetailEntityModelResponseList;

  TransactionDetailServiceResponseModelList.fromJson(Map<String, dynamic> json)
      : transactionDetailEntityModelResponseList =
            List<TransactionDetailsServiceResponseModel>.from(
                  json['accountTransactions']?.map((transactionsJSONObject) =>
                      TransactionDetailsServiceResponseModel.fromJson(
                          transactionsJSONObject)),
                ) ??
                [];

  @override
  List<Object> get props => [transactionDetailEntityModelResponseList];
}
