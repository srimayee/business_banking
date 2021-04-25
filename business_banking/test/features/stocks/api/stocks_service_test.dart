import 'package:business_banking/features/stocks/api/stocks_service.dart';
import 'package:business_banking/features/stocks/api/stocks_service_response_model.dart';
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
            "shares" : 100,
            "value" : 8938.0
          }
        ]
      }),
    );
  });
}
