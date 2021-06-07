import 'dart:math';

import 'package:business_banking/dependency/charts_flutter.dart';
import 'package:business_banking/features/stocks_portfolio/model/stock_details_view_model.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';

class StockDetailsScreen extends Screen {
  final StockDetailsViewModel viewModel;

  StockDetailsScreen({required this.viewModel});

  List<StockHistory> get days {
    List<double> values = [];
    var rando = Random();
    int min = 10;
    int max = 150;
    for (int i = 0; i < 5; i++) {
      double next = min + rando.nextInt(max - min).toDouble();
      values.add(next);
    }

    return [
      StockHistory(DateTime(2021, 6, 1), values[0]),
      StockHistory(DateTime(2021, 6, 2), values[1]),
      StockHistory(DateTime(2021, 6, 3), values[2]),
      StockHistory(DateTime(2021, 6, 4), values[3]),
      StockHistory(DateTime(2021, 6, 5), values[4]),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(viewModel.symbol,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 4, 16, 4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    viewModel.company,
                    style: TextStyle(fontSize: 14),
                  ),
                  Text(viewModel.value.toString(),
                      style: TextStyle(fontSize: 14))
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 4, 0, 4),
              child: Container(
                color: Colors.grey[100],
                height: 200,
                child: ChartsFlutter().showTimeSeriesChart(days),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 4, 4, 4),
              child: Text('Volume: ' + viewModel.volume),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 4, 4, 4),
              child: Text('Open: ' + viewModel.atOpen.toString()),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 4, 4, 4),
              child: Text('High: ' + viewModel.highValue.toString()),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 4, 4, 4),
              child: Text('Low: ' + viewModel.lowValue.toString()),
            ),
            // Text()
          ],
        ),
      ),
    );
  }
}

class StockHistory {
  final DateTime date;
  final double value;

  StockHistory(this.date, this.value);
}
