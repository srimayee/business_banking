import 'package:business_banking/features/stocks_portfolio/model/stocks_list_view_model.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class StocksListScreen extends Screen {
  final StocksListViewModel viewModel;
  final Function onAddDeleteTapped;
  final Function onStockSelected;

  const StocksListScreen(
      {Key? key,
      required this.viewModel,
      required this.onAddDeleteTapped,
      required this.onStockSelected})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Stocks'),
        actions: [
          TextButton(
              key: Key('add_delete_stock_key'),
              onPressed: () {
                onAddDeleteTapped();
              },
              child: Text('Add/Delete'))
        ],
      ),
      body: ListView.builder(
          itemCount: viewModel.stocksList.length,
          itemBuilder: (BuildContext context, int index) {
            return StockTile(
              stock: viewModel.stocksList[index],
              onTapCallback: () {
                onStockSelected(index);
              },
            );
          }),
    );
  }
}

class StockTile extends StatelessWidget {
  final Map<String, dynamic> stock;
  final Function onTapCallback;

  const StockTile({Key? key, required this.stock, required this.onTapCallback})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    String shares = stock['shares'].toString();
    String value = stock['value'].toString();
    return GestureDetector(
      onTap: () {
        onTapCallback();
      },
      child: Container(
        height: 70,
        child: Column(
          children: [
            Text(stock['company']),
            Text("shares: $shares"),
            Text("value: $value")
          ],
        ),
      ),
    );
  }
}
