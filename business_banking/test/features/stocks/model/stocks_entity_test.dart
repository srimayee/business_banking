
import 'package:flutter_test/flutter_test.dart';
import 'package:business_banking/features/stocks/model/stocks_entity.dart';

void main() {
  StocksEntity entity = StocksEntity(
      company: "Test", symbol: "TEST", atClose: 1, shares: 100, value: 100);

  test('StockEntity properties', () {
    expect(entity.company, "Test");
    expect(entity.symbol, "TEST");
    expect(entity.atClose, 1);
    expect(entity.shares, 100);
    expect(entity.value, 100);

    expect(entity.toString(), 'StocksEntity([], Test, TEST, 1.0, 100, 100.0)');
  });

  test('StocksEntity merge with errors = null', () {
    entity.merge(errors: null);
    expect(entity.company, "Test");
    expect(entity.symbol, "TEST");
    expect(entity.atClose, 1);
    expect(entity.shares, 100);
    expect(entity.value, 100);
  });
}
