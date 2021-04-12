import 'package:auto_size_text/auto_size_text.dart';
import 'package:business_banking/features/transaction/model/transaction_model.dart';
import 'package:business_banking/features/transaction/model/transaction_view_model.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:clean_framework/clean_framework.dart';
import 'package:enum_to_string/enum_to_string.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../enums.dart';

class TransactionChartScreen extends Screen {
  final TransactionViewModel viewModel;
  final VoidCallback navigateToHubScreen;

  TransactionChartScreen({
    @required this.viewModel,
    @required this.navigateToHubScreen,
  }) : assert(() {
          return viewModel != null;
        }());

  @override
  Widget build(BuildContext build) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        leading: GestureDetector(
          child: Icon(
            Icons.chevron_left,
            size: 40.0,
          ),
          onTap: () {
            navigateToHubScreen();
          },
          key: Key('backButton'),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AutoSizeText("Transaction Details"),
          ],
        ),
      ),
      body: Card(elevation: 5.0, child: DonutPieChart(viewModel: viewModel)),
    );
  }
}

class DonutPieChart extends StatelessWidget {
  final bool animate;
  final TransactionViewModel viewModel;

  DonutPieChart({this.animate, this.viewModel});

  @override
  Widget build(BuildContext context) {
    return charts.PieChart(_generateTransactionData(),
        animate: animate,
        // Configure the width of the pie slices to 60px. The remaining space in
        // the chart will be left as a hole in the center.
        defaultRenderer: charts.ArcRendererConfig(arcWidth: 50));
  }

  /// Create one series with sample hard coded data.
  List<charts.Series<TransactionModel, double>> _generateTransactionData() {
    final List<TransactionModel> data = viewModel.transactionDetails;

    return [
      charts.Series<TransactionModel, double>(
        id: 'Transactions',
        domainFn: (TransactionModel transaction, _) =>
            double.parse(transaction.transactionAmount),
        measureFn: (TransactionModel transaction, _) =>
            double.parse(transaction.transactionAmount),
        data: data,
        colorFn: (TransactionModel transaction, _) =>
            charts.ColorUtil.fromDartColor(EnumToString.fromString(
                    TransactionCategory.values, transaction.transactionCategory)
                .color),
      )
    ];
  }
}
