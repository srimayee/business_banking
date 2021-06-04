// @dart = 2.9
import 'package:business_banking/dependency/charts_flutter.dart';
import 'package:charts_flutter/flutter.dart';
import 'package:test/test.dart';

void main() {
  ChartsFlutter wrapper = ChartsFlutter();
  test('description', () {
    List<StockHistory> days = [
      StockHistory(DateTime(2021, 6, 1), 100.0),
      StockHistory(DateTime(2021, 6, 2), 105.0),
      StockHistory(DateTime(2021, 6, 3), 106.0),
      StockHistory(DateTime(2021, 6, 4), 102.0),
      StockHistory(DateTime(2021, 6, 5), 99.0),
    ];
    Series<StockHistory, DateTime> series = wrapper.makeSeriesFromList(days);
    expect(series, isA<Series<StockHistory, DateTime>>());
  });
}
