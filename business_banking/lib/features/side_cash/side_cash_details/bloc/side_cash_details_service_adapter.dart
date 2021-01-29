import 'package:business_banking/features/side_cash/side_cash_details/api/side_cash_details_response_model.dart';
import 'package:business_banking/features/side_cash/side_cash_details/api/side_cash_details_service.dart';
import 'package:business_banking/features/side_cash/side_cash_details/models/side_cash_details_entity.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework/clean_framework_defaults.dart';

class SideCashDetailsServiceAdapter extends ServiceAdapter<
    SideCashDetailsEntity,
    JsonRequestModel,
    SideCashDetailsResponseModel,
    SideCashDetailsService> {
  SideCashDetailsServiceAdapter() : super(SideCashDetailsService());

  @override
  SideCashDetailsEntity createEntity(SideCashDetailsEntity entity,
      SideCashDetailsResponseModel responseModel) {
    return SideCashDetailsEntity(
      grossSideCashBalance: responseModel.grossSideCashBalance,
      interest: responseModel.interest,
      paymentMin: responseModel.paymentMin,
      remainingCredit: responseModel.remainingCredit,
    );
  }
}
