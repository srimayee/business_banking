import 'package:business_banking/features/stocks_detail/model/stocks_list_view_model.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';

class StocksListScreen extends Screen {
  final StocksListViewModel viewModel;

  const StocksListScreen({Key? key, required this.viewModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.green, title: Text('Stocks')),
      body: 
      ListView.builder(
          itemCount: viewModel.stocksList.length,
          itemBuilder: (BuildContext context, int index) {
            return StockTile(stock: viewModel.stocksList[index]);
          }),
    );
  }
}

class StockTile extends StatelessWidget {
  final Map<String, dynamic> stock;

  const StockTile({Key? key, required this.stock}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    String shares = stock['shares'].toString();
    String value = stock['value'].toString();
    return Container(
      height: 70,
      child: Column(
        children: [
          Text(stock['company']),
          Text("shares: $shares"),
          Text("value: $value")
        ],
      ),
    );
  }
}
