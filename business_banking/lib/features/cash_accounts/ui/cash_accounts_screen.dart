import 'dart:ui';
import 'package:clean_framework/clean_framework.dart';
import 'package:business_banking/features/cash_accounts/model/cash_accounts_view_model.dart';
import 'package:flutter/material.dart';

class CashAccountsScreen extends Screen {
  final CashAccountsViewModel viewModel;
  
  CashAccountsScreen({
    @required this.viewModel
  }) : assert(() {
    return viewModel != null;
  } ());
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Hello World!',
          style: TextStyle(
            fontSize: 40.0
          ),
        ),
      ),
    );
  }
}