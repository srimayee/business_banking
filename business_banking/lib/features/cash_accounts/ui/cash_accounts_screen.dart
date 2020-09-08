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
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: Text('Business Banking'),
        ),
        backgroundColor: Colors.grey[300],
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              AccountCard(viewModel: viewModel)
            ],
          ),
        ),
      ),
    );
  }
}

class AccountCard extends StatelessWidget {
  const AccountCard({
    Key key,
    @required this.viewModel,
  }) : super(key: key);

  final CashAccountsViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 125,
      child: Card(
        color: Colors.white,
        shadowColor: Colors.grey[500],
        elevation: 3.0,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Row(
                  children: [
                    Text( //TODO: Find solution to auto-size text to avoid overflow
                      viewModel.name + ' *' + viewModel.lastFour.toString(),
                      style: TextStyle(
                        fontSize: 30.0,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Account Balance:",
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 17.0
                      ),
                    ),
                    Text(
                      '\$' + viewModel.balance.toStringAsFixed(2),
                      style: TextStyle(
                        fontSize: 25.0,
                        fontWeight: FontWeight.w300
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}