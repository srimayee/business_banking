import 'package:business_banking/features/card_usage/model/card_summary_model.dart';
import 'package:business_banking/features/card_usage/model/card_summary_view_model.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BarChart extends StatelessWidget {
  final bool animate;
  final CardSummaryViewModel viewModel;
  final simpleCurrencyFormatter =
      charts.BasicNumericTickFormatterSpec.fromNumberFormat(
          NumberFormat.compactSimpleCurrency());

  BarChart({this.animate = true, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return charts.BarChart(_generateTransactionData(),
        animate: animate,
        primaryMeasureAxis:
            charts.NumericAxisSpec(tickFormatterSpec: simpleCurrencyFormatter),
        defaultRenderer: charts.BarRendererConfig(
            cornerStrategy: const charts.ConstCornerStrategy(08)));
  }

  List<charts.Series<CardSummaryModel, String>> _generateTransactionData() {
    final List<CardSummaryModel> data = viewModel.cardTransactions;

    return [
      charts.Series<CardSummaryModel, String>(
        id: 'Transactions-Bar',
        domainFn: (CardSummaryModel transaction, _) =>
            DateFormat('MM/dd').format(transaction.date!),
        measureFn: (CardSummaryModel transaction, _) =>
            transaction.transactionAmount,
        data: data,
      )
    ];
  }
}
