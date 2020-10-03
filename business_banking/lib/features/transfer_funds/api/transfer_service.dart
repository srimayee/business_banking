import 'package:business_banking/features/transfer_funds/api/transfer_request_model.dart';
import 'package:business_banking/features/transfer_funds/api/transfer_response_model.dart';
import 'package:business_banking/locator.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework/clean_framework_defaults.dart';

class TransferFundsService extends EitherService<TransferFundsRequestModel,
    TransferFundsResponseModel> {
  TransferFundsService()
      : super(
      method: RestMethod.post,
      restApi: ExampleLocator().api,
      path: 'transfer-send');

  @override
  TransferFundsResponseModel parseResponse(Map<String, dynamic> jsonResponse) {
    return TransferFundsResponseModel.fromJson(jsonResponse);
  }
}