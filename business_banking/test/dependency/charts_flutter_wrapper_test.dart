// @dart = 2.9
import 'dart:math';

import 'package:business_banking/dependency/charts_flutter.dart';
import 'package:business_banking/features/stocks_portfolio/ui/stock_details_screen.dart';
import 'package:charts_flutter/flutter.dart';
import 'package:test/test.dart';

void main() {
  ChartsFlutter wrapper = ChartsFlutter();
  List<StockHistory> days = [
    StockHistory(DateTime(2021, 6, 1), 100.0),
    StockHistory(DateTime(2021, 6, 2), 105.0),
    StockHistory(DateTime(2021, 6, 3), 106.0),
    StockHistory(DateTime(2021, 6, 4), 102.0),
    StockHistory(DateTime(2021, 6, 5), 99.0),
  ];
  test('Charts wrapper converts list into Series', () {
    Series<StockHistory, DateTime> series = wrapper.makeSeriesFromList(days);
    expect(series, isA<Series<StockHistory, DateTime>>());
    expect(series.colorFn, isA<Function(int)>());
    expect(series.domainFn, isA<Function(int)>());
    expect(series.measureFn, isA<Function(int)>());
  });

  test('Charts wrapper returns a TimeSeriesChart', () {
    TimeSeriesChart chart = wrapper.showTimeSeriesChart(days);
    expect(chart, isA<TimeSeriesChart>());
  });
}
