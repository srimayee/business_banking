import 'package:business_banking/features/stocks_portfolio/model/stock_view_model.dart';
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
          itemCount: viewModel.viewModelList.length,
          itemBuilder: (BuildContext context, int index) {
            return StockTile(
              viewModel: viewModel.viewModelList[index],
              onTapCallback: () {
                onStockSelected(viewModel.viewModelList[index].company);
              },
            );
          }),
    );
  }
}

class StockTile extends StatelessWidget {
  final StockViewModel viewModel;
  final Function onTapCallback;

  const StockTile(
      {Key? key, required this.viewModel, required this.onTapCallback})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    String shares = viewModel.shares.toString();
    String value = viewModel.value.toString();
    String atClose = viewModel.atClose.toString();
    return GestureDetector(
      key: Key('StockTile'),
      onTap: () {
        onTapCallback();
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 70,
          child: Column(
            children: [
              Text(viewModel.company!),
              Text('at close: $atClose'),
              Text("shares: $shares"),
              Text("value: $value")
            ],
          ),
        ),
      ),
    );
  }
}
