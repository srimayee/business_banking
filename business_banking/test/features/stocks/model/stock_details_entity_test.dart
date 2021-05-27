import 'package:business_banking/features/stocks_portfolio/model/stock_details_entity.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  StockDetailsEntity entity = StockDetailsEntity(
      company: 'Disney',
      symbol: 'DIS',
      value: 100.0,
      atOpen: 110.0,
      highValue: 115.0,
      lowValue: 100.0,
      volume: '3.98M',
      history: [
        {'5_24': 100.0}
      ]);

  test('StockDetailsEntity properties', () {
    expect(entity.company, 'Disney');
    expect(entity.symbol, 'DIS');
    expect(entity.value, 100.0);
    expect(entity.atOpen, 110.0);
    expect(entity.highValue, 115.0);
    expect(entity.lowValue, 100.0);
    expect(entity.volume, '3.98M');
    expect(entity.history, [
      {'5_24': 100.0}
    ]);

    expect(entity.toString(),
        'StockDetailsEntity([], Disney, DIS, 100.0, 110.0, 115.0, 100.0, 3.98M, [{5_24: 100.0}])');
  });

  test('StockDetailsEntity merge with errors = null', () {
    entity.merge(errors: null);
    expect(entity.company, 'Disney');
    expect(entity.symbol, 'DIS');
    expect(entity.value, 100.0);
    expect(entity.atOpen, 110.0);
    expect(entity.highValue, 115.0);
    expect(entity.lowValue, 100.0);
    expect(entity.volume, '3.98M');
    expect(entity.history, [
      {'5_24': 100.0}
    ]);
  });
}
