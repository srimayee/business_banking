import 'package:business_banking/features/stocks_portfolio/api/stocks_service_response_model.dart';
import 'package:business_banking/features/stocks_portfolio/bloc/stocks_service_adapter.dart';
import 'package:business_banking/features/stocks_portfolio/model/stock_entity.dart';
import 'package:business_banking/features/stocks_portfolio/model/stocks_list_entity.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Correct Entity is created by service adapter', () {
    final entity = StocksServiceAdapter().createEntity(
        StocksListEntity(),
        StocksServiceResponseModel.fromJson({
          'stocks': [
            {
              'company': 'test',
              'symbol': 'test',
              'at_close': 1.0,
              'shares': 1.0,
              'value': 1.0
            }
          ]
        }));

    expect(
        entity,
        StocksListEntity(stocks: [
          StockEntity(
              company: 'test',
              symbol: 'test',
              atClose: 1.0,
              shares: 1.0,
              value: 1.0)
        ]));
  });
}
