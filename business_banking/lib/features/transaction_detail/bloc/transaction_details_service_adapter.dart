import 'package:business_banking/features/transaction_detail/api/transaction_detail_service_response_model.dart';
import 'package:business_banking/features/transaction_detail/api/transaction_details_service.dart';
import 'package:business_banking/features/transaction_detail/model/transaction_details_entity.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework/clean_framework_defaults.dart';

class TransactionDetailsServiceAdapter extends ServiceAdapter<
    TransactionDetailsEntity,
    JsonRequestModel,
    TransactionDetailsServiceResponseModel,
    TransactionDetailsService> {
  TransactionDetailsServiceAdapter() : super(TransactionDetailsService());

  @override
  TransactionDetailsEntity createEntity(TransactionDetailsEntity initialEntity,
      TransactionDetailsServiceResponseModel responseModel) {
    return TransactionDetailsEntity();
  }
}
