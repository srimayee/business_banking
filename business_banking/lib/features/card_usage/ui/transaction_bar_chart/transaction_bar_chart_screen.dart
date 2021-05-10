import 'package:auto_size_text/auto_size_text.dart';
import 'package:business_banking/features/card_usage/model/card_summary_view_model.dart';
import 'package:business_banking/features/card_usage/ui/category_colors.dart';

import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';

import 'bar_chart.dart';

class TransactionBarChartScreen extends Screen {
  final CardSummaryViewModel viewModel;
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
            AutoSizeText("Card Transactions"),
          ],
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: AutoSizeText('Weekly Card Usage', maxFontSize: 30.0, minFontSize: 20, style: TextStyle(color: Colors.green.shade600, fontWeight: FontWeight.w700),),
            ),
            Expanded(
              flex: 2,
              child: Container(
                margin: const EdgeInsets.all(8.0),
                child:
                    Card(elevation: 8.0, child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: BarChart(viewModel: viewModel),
                    )),
              ),
            ),
            // Expanded(
            //     child: Container(
            //         margin: const EdgeInsets.all(8.0), child: CategoryColors()))
          ],
        ),
      ),
    );
  }
}
