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
      body: Column(
        children: [
          Row(
            key: Key('stock-details-chart'),
            children: [Text('chart')],
          ),
          Row(
            children: [
              Column(
                children: [Text(viewModel.company)],
              )
            ],
          )
        ],
      ),
    );
  }
}
