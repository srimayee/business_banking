import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework/clean_framework_defaults.dart';

import '../model/mortgage_detail_entity.dart';
import '../api/mortgage_detail_service_response_model.dart';
import '../api/mortgage_detail_service.dart';

class MortgageDetailServiceAdapter extends ServiceAdapter<
    MortgageDetailEntity,
    JsonRequestModel,
    MortgageDetailServiceResponseModel,
    MortgageDetailService> {
  MortgageDetailServiceAdapter() : super(MortgageDetailService());

  @override
  MortgageDetailEntity createEntity(MortgageDetailEntity intialEntity,
      MortgageDetailServiceResponseModel responseModel) {
    return MortgageDetailEntity(
      escrowBalance: responseModel.escrowBalance,
      feesCharged: responseModel.feesCharged,
      loanNumber: responseModel.loanNumber,
    );
  }
}
