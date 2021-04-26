import 'package:business_banking/features/stocks_detail/model/stocks_view_model.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

class StocksScreen extends Screen {
  final StocksViewModel viewModel;

  StocksScreen({required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text('Stocks'),
      ),
    );
  }
}
