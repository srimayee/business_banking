import 'package:business_banking/features/customer/model/customer_detail_view_model.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';

class CustomerDetailScreen extends Screen {
  final CustomerDetailViewModel viewModel;

  CustomerDetailScreen(
      {required this.viewModel})
      : assert(() {
          return viewModel != null;
        }());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(
          "Hello Customer",
          key: Key("HCDappBarName"),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Hello ${viewModel.honorific} ${viewModel.name}",
              key: Key("HCDname"),
            ),
            Text(
              viewModel.address,
              key: Key("HCDaddress"),
            ),
          ],
        ),
      ),
    );
  }
}
