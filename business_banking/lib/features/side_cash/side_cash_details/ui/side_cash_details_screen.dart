import 'package:business_banking/features/side_cash/side_cash_details/models/side_cash_details_view_model.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';

class SideCashDetailsScreen extends Screen {
  final SideCashDetailsViewModel viewModel;

  SideCashDetailsScreen({@required this.viewModel})
      : assert(() {
          return viewModel != null;
        }());

  @override
  Widget build(BuildContext build) {
    print(viewModel.grossSideCashBalance);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Side Cash Account Details'),
      ),
      // body: Text(viewModel.grossSideCashBalance),
    );
  }
}
