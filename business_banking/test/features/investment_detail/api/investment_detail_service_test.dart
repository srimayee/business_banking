import 'package:business_banking/features/investment_detail/api/investment_detail_response_model.dart';
import 'package:business_banking/features/investment_detail/api/investment_detail_service.dart';
import 'package:test/test.dart';

void main() {
  InvestmentDetailService service;

  // Registers a function to be run before tests. This function will be called before each test is run.
  setUp(() {
    service = InvestmentDetailService();
  });

  group('Investment Detail Service Test', () {
    final tJsonResponse = {
      "accountBalance": 1169.02,
      "totalGainValue": -47.16,
      "totalGainPercent": 3.88,
      "investments": [
        {
          "symbol": "CRSP",
          "dayGainValue": -47.16,
          "dayGainPercent": -9.08,
          "price": 117.98,
          "marketValue": 471.92,
          "count": 4
        },
        {
          "symbol": "EB",
          "dayGainValue": 47.16,
          "dayGainPercent": 9.08,
          "price": 117.98,
          "marketValue": 471.92,
          "count": 4
        },
      ]
    };

    test('should perform a GET request', () async {
      final eitherResponce = await service.request();

      expect(eitherResponce.isRight, isTrue);
    });

    test(
        'should InvestmentDetailService return InvestmentDetailServiceResponseModel when the response is success',
        () async {
      final eitherResponce = await service.request();

      // expect(eitherResponce.isRight, isTrue);
      expect(eitherResponce.fold((_) {}, (m) => m),
          InvestmentDetailServiceResponseModel.fromJson(tJsonResponse));
    });
  });
}
