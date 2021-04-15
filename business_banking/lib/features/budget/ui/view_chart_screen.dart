import 'package:business_banking/features/budget/model/budget_view_model.dart';
import 'package:business_banking/features/budget/ui/donut_auto_label_chart.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';

class ViewChartScreen extends Screen {
  final BudgetViewModel viewModel;

  ViewChartScreen({required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(viewModel.accountInfo!.accountNickname),
        backgroundColor: Colors.green,
      ),
      body: Column(
        children: [
          Container(
            padding:
            const EdgeInsets.symmetric(vertical: 18.0, horizontal: 20.0),
            child: Center(
                child: Text(
                  'Your Spendings',
                  style: TextStyle(fontSize: 18),
                )),
          ),
          ConstrainedBox(
              constraints: BoxConstraints.loose(Size(
                double.infinity,
                MediaQuery.of(context).size.width / 1.8,
              )),
              child: DonutAutoLabelChart.withSampleData()),
        ],
      ),
    );
  }
}
