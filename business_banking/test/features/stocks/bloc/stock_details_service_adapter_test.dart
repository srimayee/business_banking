import 'dart:math';

import 'package:business_banking/features/stocks_portfolio/api/stock_details_responseModel.dart';
import 'package:business_banking/features/stocks_portfolio/bloc/stock_details_service_adapter.dart';
import 'package:business_banking/features/stocks_portfolio/model/stock_details_entity.dart';
import 'package:test/test.dart';

void main() {
  test('StockDetailsServiceApapter creates correct Entity', () {
    final entity = StockDetailsServiceAdapter().createEntity(
        StockDetailsEntity(),
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
        }));

    expect(entity, isA<StockDetailsEntity>());
    expect(entity.company, 'The Walt Disney Company');
  });
}
