import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework/clean_framework_defaults.dart';
import 'package:business_banking/features/request_money/model/request_money_entity.dart';
import 'package:business_banking/features/request_money/api/request_money_service.dart';
import 'package:business_banking/features/request_money/api/request_money_service_response_model.dart';

class RequestMoneyServiceAdapter extends ServiceAdapter<RequestMoneyEntity,
    JsonRequestModel, RequestMoneyServiceResponseModel, RequestMoneyService> {
  RequestMoneyServiceAdapter() :super(RequestMoneyService());

  @override
  RequestMoneyEntity createEntity(
      RequestMoneyEntity initialEntity, RequestMoneyServiceResponseModel responseModel) {
    return RequestMoneyEntity(
      name: responseModel.name,
      email: responseModel.email,
      imageUrl: responseModel.imageUrl,
      amount: responseModel.amount,
      memo: responseModel.memo,
    );
  }
}
