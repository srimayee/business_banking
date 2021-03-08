import 'package:business_banking/features/investment_detail/api/investment_detail_response_model.dart';
import 'package:business_banking/features/investment_detail/bloc/investment_detail_service_adapter.dart';
import 'package:business_banking/features/investment_detail/model/investment_detail_entity.dart';
import 'package:test/test.dart';

void main() {
  final tInvestmentEntity = InvestmentDetailEntity(
      accountBalance: 1000.00, totalGainValue: -40.00, totalGainPercent: 3.00);

  final tResponseJson = {
    "accountBalance": 1000.00,
    "totalGainValue": -40.00,
    "totalGainPercent": 3.00
  };
  test(
      'Investment Service Adapter should received a json responce and return investment entity',
      () async {
    final entity = InvestmentDetailServiceAdapter().createEntity(
        InvestmentDetailEntity(),
        InvestmentDetailServiceResponseModel.fromJson(tResponseJson));

    expect(entity, tInvestmentEntity);
  });
}
