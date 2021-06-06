import 'package:business_banking/features/stocks_portfolio/api/stocks_service.dart';
import 'package:business_banking/features/stocks_portfolio/api/stocks_service_response_model.dart';
import 'package:clean_framework/clean_framework_defaults.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('StocksService success', () async {
    final service = StocksService();
    final eitherResponse = await service.request();

    expect(eitherResponse.isRight, isTrue);
    expect(
      eitherResponse.fold((_) {}, (m) => m),
      StocksServiceResponseModel.fromJson({
        'stocks': [
          {
            "company": "Amazon.com",
            "symbol": "AMZN",
            "at_close": 89.38,
            "shares": 100,
            "value": 89.38
          },
          {
            "company": "Disney",
            "symbol": "DIS",
            "at_close": 40.65,
            "shares": 100,
            "value": 40.65
          },
          {
            "company": "PepsiCo",
            "symbol": "PEP",
            "at_close": 38.02,
            "shares": 100,
            "value": 38.02
          },
          {
            "company": "Apple",
            "symbol": "AAPL",
            "at_close": 134.22,
            "shares": 100,
            "value": 134.22
          },
          {
            "company": "Home Depot",
            "symbol": "HD",
            "at_close": 323.60,
            "shares": 100,
            "value": 323.60
          },
          {
            "company": "Nike",
            "symbol": "NIKE",
            "at_close": 130.19,
            "shares": 100,
            "value": 130.19
          }
        ]
      }),
    );
  });
}
