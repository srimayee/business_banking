import 'package:business_banking/features/stocks_portfolio/api/stock_details_responseModel.dart';
import 'package:business_banking/features/stocks_portfolio/api/stock_details_service.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework/clean_framework_defaults.dart';
import 'package:test/test.dart';

void main() {
  test('StockDetailsService success', () async {
    final service = StockDetailsService();
    final Either<ServiceFailure, StockDetailsResponseModel> eitherResponse =
        await service.request();

    expect(eitherResponse.isRight, isTrue);
    expect(
      eitherResponse.fold((_) {}, (m) => m),
      StockDetailsResponseModel.fromJson({
        "company": "The Walt Disney Company",
        "symbol": "DIS",
        "value": 176.57,
        "at_open": 176.62,
        "high_value": 177.90,
        "low_value": 176.22,
        "volume": "3.986M",
        "history": [
          {'5_20': 171.22},
          {'5_21': 172.83},
          {'5-22': 172.53},
          {'5-23': 174.79},
          {'5-24': 176.21}
        ]
      }),
    );
  });
}
