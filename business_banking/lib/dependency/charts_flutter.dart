import 'package:business_banking/features/stocks_portfolio/ui/stock_details_screen.dart';
import 'package:charts_flutter/flutter.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';

class ChartsFlutter extends ExternalDependency {
  TimeSeriesChart showTimeSeriesChart(List<StockHistory> list) {
    List<Series<StockHistory, DateTime>> seriesList = [
      makeSeriesFromList(list)
    ];
    return TimeSeriesChart(
      seriesList,
      dateTimeFactory: LocalDateTimeFactory(),
    );
  }

  Series<StockHistory, DateTime> makeSeriesFromList(List<StockHistory> list) {
    return Series<StockHistory, DateTime>(
        id: 'Week',
        colorFn: (_, __) => MaterialPalette.blue.shadeDefault,
        domainFn: (StockHistory day, _) => day.date,
        measureFn: (StockHistory day, _) => day.value,
        data: list);
  }
}
