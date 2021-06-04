//@dart=2.9
import 'package:business_banking/features/stocks_portfolio/model/stock_entity.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  StockEntity stockEntity = StockEntity(
      company: 'test', symbol: 'test', atClose: 1.0, shares: 1.0, value: 1.0);

  test('StockListEntity properties', () {
    expect(stockEntity.company, 'test');
    expect(stockEntity.symbol, 'test');
    expect(stockEntity.atClose, 1.0);
    expect(stockEntity.shares, 1.0);
    expect(stockEntity.value, 1.0);

    expect(
        stockEntity.toString(), 'StockEntity([], test, test, 1.0, 1.0, 1.0)');
  });

  test('StockEntity merge with errors = null', () {
    stockEntity.merge(errors: null);
    expect(stockEntity.company, 'test');
    expect(stockEntity.symbol, 'test');
    expect(stockEntity.atClose, 1.0);
    expect(stockEntity.shares, 1.0);
    expect(stockEntity.value, 1.0);
  });
}
