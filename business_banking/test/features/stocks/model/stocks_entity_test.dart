
import 'package:flutter_test/flutter_test.dart';
import 'package:business_banking/features/stocks/model/stocks_entity.dart';

void main() {
  StocksEntity entity = StocksEntity(stocks: ["test"], totalValue: 0.0);

  test('StockEntity properties', () {
    expect(entity.stocks, ["test"]);
    expect(entity.totalValue, 0.0);

    expect(entity.toString(), 'StocksEntity([], [test], 0.0)');
  });

  test('StocksEntity merge with errors = null', () {
    entity.merge(errors: null);
    expect(entity.stocks, ["test"]);
    expect(entity.totalValue, 0.0);
  });
}
