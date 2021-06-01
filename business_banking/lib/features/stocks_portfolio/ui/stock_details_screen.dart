import 'package:business_banking/features/stocks_portfolio/model/stock_details_view_model.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

class StockDetailsScreen extends Screen {
  final StockDetailsViewModel viewModel;

  StockDetailsScreen({required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(viewModel.company),
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
                child: Row(
                  key: Key('stock-details-chart'),
                  children: [Text('chart')],
                ),
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
