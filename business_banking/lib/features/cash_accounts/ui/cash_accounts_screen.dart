import 'dart:ui';
import 'package:clean_framework/clean_framework.dart';
import 'package:business_banking/features/cash_accounts/model/cash_accounts_view_model.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

class CashAccountsScreen extends Screen {
  final CashAccountsViewModel viewModel;
  final VoidCallback navigateToAccountDetail;

  CashAccountsScreen(
      {@required this.viewModel, @required this.navigateToAccountDetail})
      : assert(() {
          return viewModel != null;
        }());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: Text(
            'Business Banking',
            key: Key('CAappBarName')
          ),
        ),
        backgroundColor: Colors.grey[300],
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              GestureDetector(
                child: AccountCard(viewModel: viewModel, key: Key('accountCard1'),),
                onTap: () {
                  navigateToAccountDetail();
                },
              )
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
      padding: EdgeInsets.all(5.0),
      child: Card(
        color: Colors.white,
        shadowColor: Colors.grey[500],
        elevation: 3.0,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: AutoSizeText(
                        viewModel.name + ' *' + viewModel.lastFour.toString(),
                        style: TextStyle(
                          fontSize: 30.0,
                        ),
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
                      style: TextStyle(color: Colors.black54, fontSize: 17.0),
                    ),
                    Text(
                      '\$' + viewModel.balance.toStringAsFixed(2),
                      style: TextStyle(
                          fontSize: 25.0, fontWeight: FontWeight.w300),
                      key: Key('balance'),
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
