import 'package:business_banking/dependency/charts_flutter.dart';
import 'package:business_banking/features/stocks_portfolio/model/stock_details_view_model.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';

class StockDetailsScreen extends Screen {
  final StockDetailsViewModel viewModel;

  StockDetailsScreen({required this.viewModel});

  final List<StockHistory> days = [
    StockHistory(DateTime(2021, 6, 1), 10.0),
    StockHistory(DateTime(2021, 6, 2), 50.0),
    StockHistory(DateTime(2021, 6, 3), 106.0),
    StockHistory(DateTime(2021, 6, 4), 23.0),
    StockHistory(DateTime(2021, 6, 5), 122.0),
  ];

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
