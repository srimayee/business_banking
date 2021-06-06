//@dart = 2.9
import 'package:business_banking/features/stocks_portfolio/model/stock_entity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:business_banking/features/stocks_portfolio/model/stocks_list_entity.dart';

void main() {
  StockEntity stockEntity = StockEntity(
      company: 'test', symbol: 'test', atClose: 1.0, shares: 1.0, value: 1.0);
  StocksListEntity entity = StocksListEntity(stocks: [stockEntity]);

  test('StockListEntity properties', () {
    expect(entity.stocks, [stockEntity]);

    expect(entity.toString(),
        'StocksListEntity([], [StockEntity([], test, test, 1.0, 1.0, 1.0)])');
  });

  test('StocksEntity merge with errors = null', () {
    entity.merge(errors: null);
    expect(entity.stocks, [stockEntity]);
  });
}
