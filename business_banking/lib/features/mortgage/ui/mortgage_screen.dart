import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';
import '../model/mortgage_view_model.dart';

class MortgageScreen extends Screen {
  final MortgageViewModel viewModel;
  final VoidCallback navigateToMortgageDetail;

  MortgageScreen(
      {@required this.viewModel, @required this.navigateToMortgageDetail})
      : assert(viewModel != null);
  @override
  Widget build(BuildContext context) {
    return Text(viewModel.monthlyAmountDue.toString());
  }
}
