import 'package:business_banking/features/hello_customer_detail/model/hello_customer_detail_view_model.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';

class HelloCustomerDetailScreen extends Screen {
  final HelloCustomerDetailViewModel viewModel;

  HelloCustomerDetailScreen(
      {@required this.viewModel})
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
              "Hello ${viewModel.name}",
              key: Key("HCDname"),
            ),
            Text(
              viewModel.currentTimeString,
              key: Key("HCDtime"),
            ),
          ],
        ),
      ),
    );
  }
}
