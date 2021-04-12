import 'package:auto_size_text/auto_size_text.dart';
import 'package:business_banking/features/transaction/enums.dart';
import 'package:business_banking/features/transaction/model/transaction_model.dart';
import 'package:business_banking/features/transaction/model/transaction_view_model.dart';
import 'package:business_banking/features/transaction/ui/category_colors.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:clean_framework/clean_framework.dart';
import 'package:enum_to_string/enum_to_string.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionBarChartScreen extends Screen {
  final TransactionViewModel viewModel;
  final VoidCallback navigateToHubScreen;

  TransactionBarChartScreen({
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
            AutoSizeText("Transaction Pie Chart"),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              margin: const EdgeInsets.all(8.0),
              child:
                  Card(elevation: 5.0, child: BarChart(viewModel: viewModel)),
            ),
          ),
          Expanded(
              child: Container(
                  margin: const EdgeInsets.all(8.0), child: CategoryColors()))
        ],
      ),
    );
  }
}

class BarChart extends StatelessWidget {
  final bool animate;
  final TransactionViewModel viewModel;
  final simpleCurrencyFormatter =
      charts.BasicNumericTickFormatterSpec.fromNumberFormat(
          NumberFormat.compactSimpleCurrency());

  BarChart({this.animate = true, this.viewModel});

  @override
  Widget build(BuildContext context) {
    return charts.BarChart(_generateTransactionData(),
        animate: animate,
        primaryMeasureAxis:
            charts.NumericAxisSpec(tickFormatterSpec: simpleCurrencyFormatter),
        defaultRenderer: charts.BarRendererConfig(
            cornerStrategy: const charts.ConstCornerStrategy(30)));
  }

  List<charts.Series<TransactionModel, String>> _generateTransactionData() {
    final List<TransactionModel> data = viewModel.transactionDetails;

    return [
      charts.Series<TransactionModel, String>(
        id: 'Transactions-Bar',
        domainFn: (TransactionModel transaction, _) =>
            DateFormat('MM/dd/yyyy').format(transaction.date),
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
