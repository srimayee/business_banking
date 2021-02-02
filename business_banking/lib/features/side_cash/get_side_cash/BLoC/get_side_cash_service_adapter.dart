import 'package:business_banking/features/side_cash/get_side_cash/api/get_side_cash_request_model.dart';
import 'package:business_banking/features/side_cash/get_side_cash/api/get_side_cash_response_model.dart';
import 'package:business_banking/features/side_cash/get_side_cash/api/get_side_cash_service.dart';
import 'package:business_banking/features/side_cash/get_side_cash/model/get_side_cash_entity.dart';
import 'package:clean_framework/clean_framework.dart';

class GetSideCashServiceAdapter extends ServiceAdapter<GetSideCashEntity,
    GetSideCashRequestModel, GetSideCashResponseModel, GetSideCashService> {
  GetSideCashServiceAdapter() : super(GetSideCashService());

  @override
  GetSideCashEntity createEntity(
      GetSideCashEntity entity, GetSideCashResponseModel responseModel) {
    return GetSideCashEntity(requestSuccess: responseModel.success);
  }

  @override
  GetSideCashRequestModel createRequest(GetSideCashEntity entity) {
    return GetSideCashRequestModel(amountRequested: entity.amountRequested);
  }
}
